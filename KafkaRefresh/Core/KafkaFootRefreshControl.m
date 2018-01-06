/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xorshine@icloud.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaFootRefreshControl.h"

@implementation KafkaFootRefreshControl

- (void)layoutSubviews{
	[super layoutSubviews]; 
	self.top = self.scrollView.contentSize.height;
}

static inline CGPoint content_offset_refresh(KafkaFootRefreshControl *cSelf){
	return CGPointMake(cSelf.scrollView.left,
					   cSelf.scrollView.contentSize.height - cSelf.scrollView.height - cSelf.height);
}

static inline CGPoint content_offset_none(KafkaFootRefreshControl *cSelf){
	return CGPointMake(cSelf.scrollView.left,
					   cSelf.scrollView.contentSize.height - cSelf.scrollView.height);
}

- (void)setScrollViewToRefreshLocation{
	[super setScrollViewToRefreshLocation];
	
	__weak typeof(self) weakSelf = self;
	dispatch_async(dispatch_get_main_queue(), ^{
		[weakSelf setAnimateBlock:^{
			if (weakSelf.isTriggeredRefreshByUser &&
				weakSelf.scrollView.contentSize.height > weakSelf.scrollView.height){
				//This condition can be pre-execute refreshHandler, and will not feel scrollview scroll
				if (weakSelf.scrollView.offsetY < weakSelf.scrollView.contentSize.height - weakSelf.scrollView.height - weakSelf.height) {
					[weakSelf.scrollView setContentOffset:content_offset_refresh(weakSelf)];
					[weakSelf kafkaDidScrollWithProgress:0.5 max:weakSelf.stretchOffsetYAxisThreshold];
				}
			}
			weakSelf.scrollView.insetBottom = weakSelf.adjustInsetsBySystemAndManually.bottom + weakSelf.height;
		} completion:^{
			if (weakSelf.refreshHandler) weakSelf.refreshHandler();
			if (weakSelf.isTriggeredRefreshByUser) {
				weakSelf.refreshState = KafkaRefreshStateReady;
				weakSelf.refreshState = KafkaRefreshStateRefreshing;
				[weakSelf kafkaDidScrollWithProgress:1. max:weakSelf.stretchOffsetYAxisThreshold];
			} 
		}];
	});
}

- (void)setScrollViewToOriginalLocation{
	[super setScrollViewToOriginalLocation]; 
	__weak typeof(self) weakSelf = self;
	dispatch_async(dispatch_get_main_queue(), ^{
		[weakSelf setAnimateBlock:^{
			if (weakSelf.isTriggeredRefreshByUser) {
				if (weakSelf.scrollView.offsetY < weakSelf.scrollView.contentSize.height - weakSelf.scrollView.height - weakSelf.height) {
					[weakSelf.scrollView setContentOffset:content_offset_none(weakSelf)];
					weakSelf.triggeredRefreshByUser = NO;
				}
			}
			weakSelf.scrollView.insetBottom = weakSelf.adjustInsetsBySystemAndManually.bottom;
		} completion:^{
			weakSelf.refreshState = KafkaRefreshStateNone;
		}];
	});
}

#pragma mark - contentOffset

static inline CGFloat max_content_offset_y_threshold(KafkaRefreshControl * cSelf){
	return MAX(cSelf.scrollView.contentSize.height - cSelf.scrollView.height, 0.0f) + cSelf.stretchOffsetYAxisThreshold*cSelf.height + cSelf.adjustInsetsBySystemAndManually.bottom;
}

static inline CGFloat min_content_offset_y_threshold(KafkaRefreshControl * cSelf){
	return MAX(cSelf.scrollView.contentSize.height - cSelf.scrollView.height, 0.0f)+cSelf.adjustInsetsBySystemAndManually.bottom;
}

- (void)kafkaScrollViewContentOffsetDidChange:(CGPoint)contentOffset{
	CGFloat maxContentOffsetYThreshold = max_content_offset_y_threshold(self);
	CGFloat minContentOffsetYThreshold = min_content_offset_y_threshold(self);
	CGFloat originY = contentOffset.y;
	CGFloat contentOffsetBottom = self.scrollView.contentSize.height - self.scrollView.height;
	
	if (self.refreshState != KafkaRefreshStateRefreshing) {
		if (originY < contentOffsetBottom) return;
		
		if (self.isTriggeredRefreshByUser) return;
		
		if (self.refreshState == KafkaRefreshStateScrolling){
			CGFloat progress = (originY - contentOffsetBottom)/self.height;
			progress = (progress <= self.stretchOffsetYAxisThreshold ? progress :self.stretchOffsetYAxisThreshold);
			self.progress = progress;
		}
		
		if (!self.scrollView.isDragging &&
			self.refreshState == KafkaRefreshStateReady){
			self.triggeredRefreshByUser = NO;
			self.refreshState = KafkaRefreshStateRefreshing;
			[self setScrollViewToRefreshLocation];
		}
		else if (originY <= minContentOffsetYThreshold &&
				 self.refreshState != KafkaRefreshStateNone){
			self.refreshState = KafkaRefreshStateNone;
		}
		else if (originY >= minContentOffsetYThreshold &&
				 originY <= maxContentOffsetYThreshold &&
				 self.refreshState != KafkaRefreshStateScrolling){
			self.refreshState = KafkaRefreshStateScrolling;
		}
		else if (originY > maxContentOffsetYThreshold &&
				 self.refreshState == KafkaRefreshStateScrolling){
			self.refreshState = KafkaRefreshStateReady;
		}
	}
}

@end
