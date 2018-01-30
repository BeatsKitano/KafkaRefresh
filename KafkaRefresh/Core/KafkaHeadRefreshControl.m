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
	self.kaf_top = -self.kaf_height;
}
 
static inline CGPoint content_offset_refresh(KafkaHeadRefreshControl *cSelf){
	UIScrollView * sc = cSelf.scrollView;
	CGFloat x = sc.kaf_left;
	CGFloat y = -(cSelf.kaf_height + cSelf.adjustInsetsBySystemAndManually.top);
	return CGPointMake(x,y);
}

- (void)setScrollViewToRefreshLocation{
	[super setScrollViewToRefreshLocation];
	__weak typeof(self) weakSelf = self;
	
	dispatch_block_t animatedBlock = ^(void){
		if (weakSelf.isTriggeredRefreshByUser) {
			weakSelf.refreshState = KafkaRefreshStateScrolling;
			///////////////////////////////////////////////////////////////////////////////////////////
			//This condition can be pre-execute refreshHandler, and will not feel scrollview scroll
			///////////////////////////////////////////////////////////////////////////////////////////
			if (weakSelf.scrollView.offsetY >= -weakSelf.adjustInsetsBySystemAndManually.top &&
				weakSelf.scrollView.offsetY <= -(weakSelf.adjustInsetsBySystemAndManually.top-weakSelf.kaf_height)) {
				[weakSelf.scrollView setContentOffset:content_offset_refresh(weakSelf)];
				[weakSelf kafkaDidScrollWithProgress:0.5 max:weakSelf.stretchOffsetYAxisThreshold];
			}
		}
		weakSelf.scrollView.insetTop = weakSelf.kaf_height + weakSelf.adjustInsetsBySystemAndManually.top;
	};
	
	dispatch_block_t completionBlock = ^(void){
		if (weakSelf.isTriggeredRefreshByUser) {
			weakSelf.refreshState = KafkaRefreshStateReady;
			weakSelf.refreshState = KafkaRefreshStateRefreshing;
			[weakSelf kafkaDidScrollWithProgress:1. max:weakSelf.stretchOffsetYAxisThreshold];
		}
		if (weakSelf.refreshHandler) weakSelf.refreshHandler();
	};
	
	dispatch_async(dispatch_get_main_queue(), ^{
		weakSelf.adjustInsetsBySystemAndManually = weakSelf.scrollView.realContentInset;
		[weakSelf setAnimateBlock:animatedBlock completion:completionBlock];
	});
}

- (void)setScrollViewToOriginalLocation{
	[super setScrollViewToOriginalLocation];
	__weak typeof(self) weakSelf = self; 
	[self setAnimateBlock:^{
		weakSelf.animating = YES;
		weakSelf.scrollView.insetTop = weakSelf.adjustInsetsBySystemAndManually.top;
	} completion:^{
		weakSelf.animating = NO;
		weakSelf.triggeredRefreshByUser = NO;
		weakSelf.refreshState = KafkaRefreshStateNone;
	}];
}

#pragma mark - contentOffset

static inline CGFloat max_content_offset_y_threshold(KafkaRefreshControl * cSelf){
	CGFloat y = -cSelf.adjustInsetsBySystemAndManually.top + cSelf.stretchOffsetYAxisThreshold * cSelf.kaf_top;
	return y;
}

static inline CGFloat min_content_offset_y_threshold(KafkaRefreshControl * cSelf){
	CGFloat y = -cSelf.adjustInsetsBySystemAndManually.top;
	return y;
}

- (void)kafkaScrollViewContentOffsetDidChange:(CGPoint)contentOffset{
	CGFloat maxContentOffsetYThreshold = max_content_offset_y_threshold(self);
	CGFloat minContentOffsetYThreshold = min_content_offset_y_threshold(self);
	CGFloat originY = contentOffset.y;
	
	if (self.refreshState == KafkaRefreshStateRefreshing) {
		/////////////////////////////////////////////////////
		//fix hover problem of sectionHeader
		/////////////////////////////////////////////////////
		if (originY < 0) {
			if (-originY >= self.adjustInsetsBySystemAndManually.top) {
				if (-originY > self.adjustInsetsBySystemAndManually.top + self.kaf_height) {
					self.scrollView.insetTop = self.adjustInsetsBySystemAndManually.top + self.kaf_height;
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
		self.adjustInsetsBySystemAndManually = self.scrollView.realContentInset;
		if (self.refreshState == KafkaRefreshStateScrolling){
			CGFloat progress = (fabs((double)originY) - self.adjustInsetsBySystemAndManually.top)/self.kaf_height;
			if (progress <= self.stretchOffsetYAxisThreshold) {
				self.progress = progress;
			}
		}
		if (!self.scrollView.isDragging &&
			self.refreshState == KafkaRefreshStateReady){
			self.triggeredRefreshByUser = NO;
			self.refreshState = KafkaRefreshStateRefreshing;
			[self setScrollViewToRefreshLocation];
		}
		else if (originY >= minContentOffsetYThreshold && !self.isAnimating){ 
			self.refreshState = KafkaRefreshStateNone;
		}
		else if (self.scrollView.isDragging &&
				 originY <= minContentOffsetYThreshold &&
				 originY >= maxContentOffsetYThreshold &&
				 self.refreshState != KafkaRefreshStateScrolling){
			self.refreshState = KafkaRefreshStateScrolling;
		}
		else if (self.scrollView.isDragging &&
				 originY < maxContentOffsetYThreshold &&
				 self.refreshState != KafkaRefreshStateReady){ 
			self.refreshState = KafkaRefreshStateReady;
		}
	}
}

@end
