/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xorshine@icloud.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaHeadRefreshControl.h"

@implementation KafkaHeadRefreshControl

- (void)layoutSubviews{
	[super layoutSubviews];
	self.top = -self.height;
}
 
static inline CGPoint content_offset_refresh(KafkaHeadRefreshControl *cSelf){
	return CGPointMake(cSelf.scrollView.left,-cSelf.height);
}

static inline CGPoint content_offset_none(KafkaHeadRefreshControl *cSelf){
	return CGPointMake(cSelf.scrollView.left, 0);
}

- (void)setScrollViewToRefreshLocation{
	[super setScrollViewToRefreshLocation];
	
	__weak typeof(self) weakSelf = self;
	[self setAnimateBlock:^{
		if (weakSelf.isTriggeredRefreshByUser) {
			//This condition can be pre-execute refreshHandler, and will not feel scrollview scroll
			if (weakSelf.scrollView.offsetY < self.height) {
				[weakSelf.scrollView setContentOffset:content_offset_refresh(weakSelf)];
				[weakSelf kafkaDidScrollWithProgress:0.5 max:weakSelf.stretchOffsetYAxisThreshold];
			}
		}
		weakSelf.scrollView.insetTop = weakSelf.height + weakSelf.adjustInsetsBySystemAndManually.top;
	} completion:^{
		if (weakSelf.isTriggeredRefreshByUser) {
			weakSelf.refreshState = KafkaRefreshStateReady;
			weakSelf.refreshState = KafkaRefreshStateRefreshing;
			[weakSelf kafkaDidScrollWithProgress:1. max:weakSelf.stretchOffsetYAxisThreshold];
		}
		if (weakSelf.refreshHandler) weakSelf.refreshHandler();
	}];
}

- (void)setScrollViewToOriginalLocation{
	[super setScrollViewToOriginalLocation];
	__weak typeof(self) weakSelf = self; 
	[self setAnimateBlock:^{
		weakSelf.scrollView.insetTop = weakSelf.adjustInsetsBySystemAndManually.top;
		if (weakSelf.isTriggeredRefreshByUser) {
			if (weakSelf.scrollView.offsetY < self.height) {
				[weakSelf.scrollView setContentOffset:content_offset_none(weakSelf)];
			}
		}
	} completion:^{
		weakSelf.triggeredRefreshByUser = NO;
		weakSelf.refreshState = KafkaRefreshStateNone;
	}];
}

#pragma mark - contentOffset

static inline CGFloat max_content_offset_y_threshold(KafkaRefreshControl * cSelf){
	return -cSelf.adjustInsetsBySystemAndManually.top + cSelf.stretchOffsetYAxisThreshold * cSelf.top;
}

static inline CGFloat min_content_offset_y_threshold(KafkaRefreshControl * cSelf){
	return -cSelf.adjustInsetsBySystemAndManually.top;
}

- (void)kafkaScrollViewContentOffsetDidChange:(CGPoint)contentOffset{
	CGFloat maxContentOffsetYThreshold = max_content_offset_y_threshold(self);
	CGFloat minContentOffsetYThreshold = min_content_offset_y_threshold(self);
	CGFloat originY = contentOffset.y;
	
	if (self.refreshState == KafkaRefreshStateRefreshing) {
		//fix hover problem of sectionHeader
		if (originY < 0) {
			if (-originY >= self.adjustInsetsBySystemAndManually.top) {
				if (-originY > self.adjustInsetsBySystemAndManually.top + self.height) {
					self.scrollView.insetTop = self.adjustInsetsBySystemAndManually.top + self.height;
				}else{
					self.scrollView.insetTop = -originY;
				}
			}
		}else{
			if (self.scrollView.insetTop != self.adjustInsetsBySystemAndManually.top) {
				self.scrollView.insetTop = self.adjustInsetsBySystemAndManually.top;
			}
		}
	}else{
		if (self.isTriggeredRefreshByUser) return;
		
		if (self.refreshState == KafkaRefreshStateScrolling){
			CGFloat progress = (fabs((double)originY) - self.adjustInsetsBySystemAndManually.top)/self.height;
			progress = (progress <= self.stretchOffsetYAxisThreshold ? progress :self.stretchOffsetYAxisThreshold);
			self.progress = progress;
		}
		
		if (!self.scrollView.isDragging &&
			self.refreshState == KafkaRefreshStateReady){
			self.triggeredRefreshByUser = NO;
			self.refreshState = KafkaRefreshStateRefreshing;
			[self setScrollViewToRefreshLocation];
		}
		else if (originY >= minContentOffsetYThreshold &&
			self.refreshState != KafkaRefreshStateNone){ 
			self.refreshState = KafkaRefreshStateNone;
		}
		else if (originY <= minContentOffsetYThreshold &&
				 originY >= maxContentOffsetYThreshold &&
				 self.refreshState != KafkaRefreshStateScrolling){
			self.refreshState = KafkaRefreshStateScrolling;
		}
		else if (originY < maxContentOffsetYThreshold &&
				 self.refreshState == KafkaRefreshStateScrolling){
			self.refreshState = KafkaRefreshStateReady;
		}
	}
}

@end
