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
	self.kaf_top = self.scrollView.contentHeight;
}

static inline CGPoint RefreshingPoint(KafkaFootRefreshControl *cSelf){
	UIScrollView * sc = cSelf.scrollView;
	CGFloat x = sc.kaf_left;
	CGFloat y = sc.contentHeight - sc.kaf_height - cSelf.kaf_height;
	return CGPointMake(x,y);
}

- (void)setScrollViewToRefreshLocation{
	[super setScrollViewToRefreshLocation];
	__weak typeof(self) weakSelf = self;
	
	dispatch_block_t animatedBlock = ^(void){
		if (weakSelf.isTriggeredRefreshByUser) {
			weakSelf.refreshState = KafkaRefreshStateScrolling;
			if (weakSelf.scrollView.contentHeight >= weakSelf.scrollView.kaf_height &&
				weakSelf.scrollView.offsetY >= weakSelf.scrollView.contentHeight - weakSelf.scrollView.kaf_height) {
				///////////////////////////////////////////////////////////////////////////////////////////
				///This condition can be pre-execute refreshHandler, and will not feel scrollview scroll
				///////////////////////////////////////////////////////////////////////////////////////////
				[weakSelf.scrollView setContentOffset:RefreshingPoint(weakSelf)];
				[weakSelf kafkaDidScrollWithProgress:0.5 max:weakSelf.stretchOffsetYAxisThreshold];
			}
		}
		weakSelf.scrollView.insetBottom = weakSelf.preSetContentInsets.bottom + weakSelf.kaf_height;
	};
	
	dispatch_block_t completionBlock = ^(void){
		if (weakSelf.refreshHandler) weakSelf.refreshHandler();
		if (weakSelf.isTriggeredRefreshByUser) {
			weakSelf.refreshState = KafkaRefreshStateReady;
			weakSelf.refreshState = KafkaRefreshStateRefreshing;
			[weakSelf kafkaDidScrollWithProgress:1. max:weakSelf.stretchOffsetYAxisThreshold];
		}
	};
	
	dispatch_async(dispatch_get_main_queue(), ^{
		weakSelf.preSetContentInsets = weakSelf.scrollView.realContentInset;
		[weakSelf setAnimateBlock:animatedBlock completion:completionBlock];
	});
}

- (void)setScrollViewToOriginalLocation{
	[super setScrollViewToOriginalLocation];
	__weak typeof(self) weakSelf = self;
	[self setAnimateBlock:^{
		weakSelf.animating = YES;
		weakSelf.scrollView.insetBottom = weakSelf.preSetContentInsets.bottom;
	} completion:^{
		weakSelf.animating = NO;
		weakSelf.triggeredRefreshByUser = NO;
		weakSelf.refreshState = KafkaRefreshStateNone;
	}];
}

#pragma mark - contentOffset

static CGFloat MaxYForTriggeringRefresh(KafkaRefreshControl * cSelf){
	UIScrollView * sc = cSelf.scrollView;
	CGFloat y = sc.contentHeight - sc.kaf_height + cSelf.stretchOffsetYAxisThreshold*cSelf.kaf_height + cSelf.preSetContentInsets.bottom;
	return y;
}

static CGFloat MinYForNone(KafkaRefreshControl * cSelf){
	UIScrollView * sc = cSelf.scrollView;
	CGFloat y = sc.contentHeight - sc.kaf_height + cSelf.preSetContentInsets.bottom;
	return y;
}

- (void)privateContentOffsetOfScrollViewDidChange:(CGPoint)contentOffset{
	[super privateContentOffsetOfScrollViewDidChange:contentOffset];
	if (self.refreshState != KafkaRefreshStateRefreshing) {
		if (self.isTriggeredRefreshByUser) return;
		
		self.preSetContentInsets = self.scrollView.realContentInset;
		
		CGFloat originY = 0.0, maxY = 0.0, minY = 0.0;
		if (self.scrollView.contentHeight + self.preSetContentInsets.top <= self.scrollView.kaf_height){
			maxY = self.stretchOffsetYAxisThreshold*self.kaf_height;
			minY = 0;
			originY = contentOffset.y + self.preSetContentInsets.top; 
			if (self.refreshState == KafkaRefreshStateScrolling){
				CGFloat progress = fabs(originY)/self.kaf_height;
				if (progress <= self.stretchOffsetYAxisThreshold) {
					self.progress = progress;
				}
			}
		}else{
			maxY = MaxYForTriggeringRefresh(self);
			minY = MinYForNone(self);
			originY = contentOffset.y;
			/////////////////////////
			///uncontinuous callback
			/////////////////////////
			if (originY < minY - 50.0) return; 
			CGFloat contentOffsetBottom = self.scrollView.contentHeight - self.scrollView.kaf_height;
			if (self.refreshState == KafkaRefreshStateScrolling){
				CGFloat progress = fabs((originY - contentOffsetBottom - self.preSetContentInsets.bottom))/self.kaf_height; 
				if (progress <= self.stretchOffsetYAxisThreshold) {
					self.progress = progress;
				}
			}
		}
		
		if (!self.scrollView.isDragging && self.refreshState == KafkaRefreshStateReady){
			self.triggeredRefreshByUser = NO;
			self.refreshState = KafkaRefreshStateRefreshing;
			[self setScrollViewToRefreshLocation];
		}
		else if (originY <= minY && !self.isAnimating){
			self.refreshState = KafkaRefreshStateNone;
		}
		else if (self.scrollView.isDragging && originY >= minY
				 && originY <= maxY && self.refreshState != KafkaRefreshStateScrolling){
			self.refreshState = KafkaRefreshStateScrolling;
		}
		else if (self.scrollView.isDragging && originY > maxY && !self.isAnimating
				 && self.refreshState != KafkaRefreshStateReady && !self.isShouldNoLongerRefresh){
			self.refreshState = KafkaRefreshStateReady;
		}
	}
}

@end
