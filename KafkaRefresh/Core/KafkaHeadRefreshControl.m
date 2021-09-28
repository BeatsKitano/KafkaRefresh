/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xiaohuiprivate@gmail.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaHeadRefreshControl.h"
#import "KafkaCategories.h"

@implementation KafkaHeadRefreshControl

- (void)layoutSubviews{
	[super layoutSubviews];
	self.kr_top = -self.kr_height;
}
 
static inline CGPoint RefreshingPoint(KafkaHeadRefreshControl *cSelf){
	UIScrollView * sc = cSelf.scrollView;
	CGFloat x = sc.kr_left;
	CGFloat y = -(cSelf.kr_height + cSelf.presetContentInsets.top);
	return CGPointMake(x, y);
}

- (void)setScrollViewToRefreshLocation{
	[super setScrollViewToRefreshLocation];
	dispatch_block_t animatedBlock = ^(void){
		if (self.isTriggeredRefreshByUser) {
			self.refreshState = KafkaRefreshStateScrolling; 
			/*///////////////////////////////////////////////////////////////////////////////////////////
			 In general, we use UITableView, especially UITableView need to use the drop-down refresh,
			 we rarely set SectionHeader. Unfortunately, if you use SectionHeader and integrate with
			 UIRefreshControl or other third-party libraries, the refresh effect will be very ugly.
			 
			 This code has two effects:
			 1.  when using SectionHeader refresh effect is still very natural.
			 2.  when your scrollView using preloading technology, only in the right place,
				 such as pull down a pixel you can see the refresh control case, will show the
				 refresh effect. If the pull-down distance exceeds the height of the refresh control,
				 then the refresh control has long been unable to appear on the screen,
				 indicating that the top of the contentOffset office there is a long distance,
				 this time, even if you call the beginRefreshing method, ScrollView position and effect
				 are Will not be affected, so the deal is very friendly in the data preloading technology.
			///////////////////////////////////////////////////////////////////////////////////////////*/
            CGFloat min = -self.presetContentInsets.top;
            CGFloat max = -(self.presetContentInsets.top-self.kr_height);
            if (self.scrollView.offsetY >= min && self.scrollView.offsetY <= max) {
                [self.scrollView setContentOffset:RefreshingPoint(self)];
                [self kafkaDidScrollWithProgress:0.5 max:self.stretchOffsetYAxisThreshold];
                self.scrollView.insetTop = self.kr_height + self.presetContentInsets.top;
            }
		}else{
			self.scrollView.insetTop = self.kr_height + self.presetContentInsets.top;
		}
	};
	
	dispatch_block_t completionBlock = ^(void){
		if (self.isTriggeredRefreshByUser) {
			self.refreshState = KafkaRefreshStateReady;
			self.refreshState = KafkaRefreshStateRefreshing;
			[self kafkaDidScrollWithProgress:1. max:self.stretchOffsetYAxisThreshold];
		}
		if (self.refreshHandler) self.refreshHandler();
	};
	@weakify(self);
	dispatch_async(dispatch_get_main_queue(), ^{
        @strongify(self);
		self.presetContentInsets = self.scrollView.realContentInset;
		[self setAnimateBlock:animatedBlock completion:completionBlock];
	});
}

- (void)setScrollViewToOriginalLocation:(dispatch_block_t)block{
    [super setScrollViewToOriginalLocation:block];
	dispatch_block_t animation = ^{
		self.animating = YES;
		self.scrollView.insetTop = self.presetContentInsets.top;
	};
	
	dispatch_block_t completion = ^{
		self.animating = NO;
		self.triggeredRefreshByUser = NO;
		self.refreshState = KafkaRefreshStateNone;
        if (block) {
            block();
        }
    };
	[self setAnimateBlock:animation completion:completion];
}

#pragma mark - contentOffset

static CGFloat MaxYForTriggeringRefresh(KafkaRefreshControl * cSelf){
	CGFloat y = -cSelf.presetContentInsets.top + cSelf.stretchOffsetYAxisThreshold * cSelf.kr_top;
	return y;
}

static CGFloat MinYForNone(KafkaRefreshControl * cSelf){
	return -cSelf.presetContentInsets.top;;
}

- (void)privateContentOffsetOfScrollViewDidChange:(CGPoint)contentOffset{
	[super privateContentOffsetOfScrollViewDidChange:contentOffset];
	CGFloat maxY = MaxYForTriggeringRefresh(self);
	CGFloat minY = MinYForNone(self);
	CGFloat originY = contentOffset.y;
	
	if (self.refreshState == KafkaRefreshStateRefreshing) {
		/////////////////////////////////////////////////////
		//fix hover problem of sectionHeader
		/////////////////////////////////////////////////////
		if (originY < 0 && (-originY >= self.presetContentInsets.top)) {
			CGFloat threshold = self.presetContentInsets.top + self.kr_height;
			if (-originY > threshold) {
				self.scrollView.insetTop = threshold;
			}else{
				self.scrollView.insetTop = -originY;
			}
		}else{
			if (self.scrollView.insetTop != self.presetContentInsets.top) {
				self.scrollView.insetTop = self.presetContentInsets.top;
			}
		}
	}else{
		if (self.isTriggeredRefreshByUser) return;
		
		self.presetContentInsets = self.scrollView.realContentInset;
		
		if (self.refreshState == KafkaRefreshStateScrolling){
			CGFloat progress = (fabs((double)originY) - self.presetContentInsets.top)/self.kr_height;
			if (progress <= self.stretchOffsetYAxisThreshold) {
				self.progress = progress;
			}
		}
		
		if (!self.scrollView.isDragging && self.refreshState == KafkaRefreshStateReady){
			self.triggeredRefreshByUser = NO;
			self.refreshState = KafkaRefreshStateRefreshing;
			[self setScrollViewToRefreshLocation];
		}
		else if (originY >= minY && !self.isAnimating){
			self.refreshState = KafkaRefreshStateNone;
		}
		else if (self.scrollView.isDragging && originY <= minY
				 && originY >= maxY && self.refreshState != KafkaRefreshStateScrolling){
			self.refreshState = KafkaRefreshStateScrolling;
		}
		else if (self.scrollView.isDragging && originY < maxY && !self.isAnimating
				 && self.refreshState != KafkaRefreshStateReady && !self.isShouldNoLongerRefresh){
			self.refreshState = KafkaRefreshStateReady;
		}
	}
}

@end
