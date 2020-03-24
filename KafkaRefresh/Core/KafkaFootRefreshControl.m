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
#import "KafkaCategories.h"

@implementation KafkaFootRefreshControl

- (void)layoutSubviews {
	[super layoutSubviews]; 
	self.kr_top = self.scrollView.contentHeight;
}

- (void)setScrollViewToRefreshLocation {
	[super setScrollViewToRefreshLocation];
	dispatch_block_t animation = ^(void){
		if (self.isTriggeredRefreshByUser) {
			self.refreshState = KafkaRefreshStateScrolling;
			if (self.scrollView.contentHeight > self.scrollView.kr_height &&
				self.scrollView.offsetY >= OffsetOfTriggeringFootRefreshControlToRefresh(self)) {
				/**
                 This condition can be pre-execute refreshHandler, and will not feel scrollview scroll
                 */
				[self.scrollView setContentOffset:RefreshingPoint(self)];
				[self kafkaDidScrollWithProgress:0.5 max:self.stretchOffsetYAxisThreshold];
			}
		}
		self.scrollView.insetBottom = self.presetContentInsets.bottom + self.kr_height;
	};
	
	dispatch_block_t completion = ^(void){
		if (self.refreshHandler) self.refreshHandler();
		if (self.isTriggeredRefreshByUser) {
			self.refreshState = KafkaRefreshStateReady;
			self.refreshState = KafkaRefreshStateRefreshing;
			[self kafkaDidScrollWithProgress:1. max:self.stretchOffsetYAxisThreshold];
		}
	};
    @weakify(self);
	dispatch_async(dispatch_get_main_queue(), ^{
        @strongify(self);
		self.presetContentInsets = self.scrollView.realContentInset;
		[self setAnimateBlock:animation completion:completion];
	});
}

- (void)setScrollViewToOriginalLocation:(dispatch_block_t)completion {
    [super setScrollViewToOriginalLocation:completion];
    @weakify(self);
	[self setAnimateBlock:^{
        @strongify(self);
		self.animating = YES;
		self.scrollView.insetBottom = self.presetContentInsets.bottom;
	} completion:^{
        @strongify(self);
		self.animating = NO;
		self.triggeredRefreshByUser = NO;
		self.refreshState = KafkaRefreshStateNone;
        if (completion) {
            completion();
        }
	}];
}

#pragma mark - contentOffset


static CGPoint RefreshingPoint(KafkaFootRefreshControl *cSelf) {
    UIScrollView * sc = cSelf.scrollView;
    CGFloat x = sc.kr_left;
//    CGFloat y = sc.contentHeight - sc.height + cSelf.height*cSelf.stretchOffsetYAxisThreshold;
    return CGPointMake(x, OffsetOfTriggeringFootRefreshControlToRefresh(cSelf));
}


static CGFloat OffsetOfTriggeringFootRefreshControlToRefresh(KafkaRefreshControl * cSelf) {
	UIScrollView * sc = cSelf.scrollView;
	CGFloat y = sc.contentHeight - sc.kr_height + cSelf.stretchOffsetYAxisThreshold*cSelf.kr_height + cSelf.presetContentInsets.bottom;
	return y;
}

static CGFloat OffsetOfTriggeringFootRefreshControlToAutoRefresh(KafkaRefreshControl * cSelf) {
    UIScrollView * sc = cSelf.scrollView;
    CGFloat y = sc.contentHeight - sc.kr_height + cSelf.presetContentInsets.bottom;
    return y;
}

static CGFloat OffsetOfFootRefreshControlToRestore(KafkaRefreshControl * cSelf) {
	UIScrollView * sc = cSelf.scrollView;
	CGFloat y = sc.contentHeight - sc.kr_height + cSelf.presetContentInsets.bottom;
	return y;
}

- (void)privateContentOffsetOfScrollViewDidChange:(CGPoint)contentOffset{
	[super privateContentOffsetOfScrollViewDidChange:contentOffset];
	if(self.isRefresh || self.isAnimating) return;
    
	if (self.refreshState != KafkaRefreshStateRefreshing) {
		if (self.isTriggeredRefreshByUser) return;
		self.presetContentInsets = self.scrollView.realContentInset;
		
		CGFloat originY = 0.0, maxY = 0.0, minY = 0.0 , contentOffsetYInBottom = 0.0;
        
		if (self.scrollView.contentHeight + self.presetContentInsets.top <= self.scrollView.kr_height) {
			maxY = self.stretchOffsetYAxisThreshold * self.kr_height;
			minY = 0;
			originY = contentOffset.y + self.presetContentInsets.top;
            
			if (self.refreshState == KafkaRefreshStateScrolling) {
				CGFloat progress = fabs(originY) / self.kr_height;
				if (progress <= self.stretchOffsetYAxisThreshold) {
					self.progress = progress;
				}
			}
		} else {
			maxY = OffsetOfTriggeringFootRefreshControlToRefresh(self);
			minY = OffsetOfFootRefreshControlToRestore(self);
			originY = contentOffset.y;
			contentOffsetYInBottom = self.scrollView.contentHeight - self.scrollView.kr_height;
			/////////////////////////
			///uncontinuous callback
			/////////////////////////
			static CGFloat uncontinuousOpt = 50.;
			if (originY < minY - uncontinuousOpt) return;
			
			if (self.refreshState == KafkaRefreshStateScrolling){
				CGFloat progress = fabs((originY - contentOffsetYInBottom - self.presetContentInsets.bottom))/self.kr_height; 
				if (progress <= self.stretchOffsetYAxisThreshold) {
					self.progress = progress;
				}
			}
            
            if (self.autoRefreshOnFoot) {
                if (self.scrollView.isDragging && originY > OffsetOfTriggeringFootRefreshControlToAutoRefresh(self) && !self.isAnimating && self.refreshState == KafkaRefreshStateNone && !self.isShouldNoLongerRefresh) {
                    [self beginRefreshing];
                }
                return;
            }
		}
        
		if (!self.scrollView.isDragging && self.refreshState == KafkaRefreshStateReady) {
			self.triggeredRefreshByUser = NO;
			self.refreshState = KafkaRefreshStateRefreshing;
			[self setScrollViewToRefreshLocation];
		}
		else if (originY <= minY && !self.isAnimating) {
			self.refreshState = KafkaRefreshStateNone;
		}
		else if (self.scrollView.isDragging && originY >= minY && originY <= maxY && self.refreshState != KafkaRefreshStateScrolling) {
			self.refreshState = KafkaRefreshStateScrolling;
		}
		else if (self.scrollView.isDragging && originY > maxY && !self.isAnimating && self.refreshState != KafkaRefreshStateReady && !self.isShouldNoLongerRefresh) {
			self.refreshState = KafkaRefreshStateReady;
		}
	}
}

@end
