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
	self.kaf_top = self.scrollView.contentSize.height;
}

static inline CGPoint content_offset_refresh(KafkaFootRefreshControl *cSelf){
	return CGPointMake(cSelf.scrollView.kaf_left,
					   cSelf.scrollView.contentSize.height - cSelf.scrollView.kaf_height - cSelf.kaf_height);
}

- (void)setScrollViewToRefreshLocation{
	[super setScrollViewToRefreshLocation];
	__weak typeof(self) weakSelf = self;
	[self setAnimateBlock:^{
		if (weakSelf.isTriggeredRefreshByUser &&
			weakSelf.scrollView.contentSize.height >= weakSelf.scrollView.kaf_height &&
			weakSelf.scrollView.offsetY >= weakSelf.scrollView.contentSize.height - weakSelf.scrollView.kaf_height){
			///This condition can be pre-execute refreshHandler, and will not feel scrollview scroll
			[weakSelf.scrollView setContentOffset:content_offset_refresh(weakSelf)];
			[weakSelf kafkaDidScrollWithProgress:0.5 max:weakSelf.stretchOffsetYAxisThreshold];
		}
		weakSelf.scrollView.insetBottom = weakSelf.adjustInsetsBySystemAndManually.bottom + weakSelf.kaf_height;
	} completion:^{
		if (weakSelf.refreshHandler) weakSelf.refreshHandler();
		if (weakSelf.isTriggeredRefreshByUser) {
			weakSelf.refreshState = KafkaRefreshStateReady;
			weakSelf.refreshState = KafkaRefreshStateRefreshing;
			[weakSelf kafkaDidScrollWithProgress:1. max:weakSelf.stretchOffsetYAxisThreshold];
		}
	}];
}

- (void)setScrollViewToOriginalLocation{
	[super setScrollViewToOriginalLocation]; 
	__weak typeof(self) weakSelf = self;
	[self setAnimateBlock:^{
		weakSelf.animating = YES;
		weakSelf.scrollView.insetBottom = weakSelf.adjustInsetsBySystemAndManually.bottom;
	} completion:^{
		weakSelf.animating = NO;
		weakSelf.triggeredRefreshByUser = NO;
		weakSelf.refreshState = KafkaRefreshStateNone;
	}];
}

#pragma mark - contentOffset

static inline CGFloat max_content_offset_y_threshold(KafkaRefreshControl * cSelf){
	return cSelf.scrollView.contentSize.height - cSelf.scrollView.kaf_height + cSelf.stretchOffsetYAxisThreshold*cSelf.kaf_height + cSelf.adjustInsetsBySystemAndManually.bottom;
}

static inline CGFloat min_content_offset_y_threshold(KafkaRefreshControl * cSelf){
	return cSelf.scrollView.contentSize.height - cSelf.scrollView.kaf_height + cSelf.adjustInsetsBySystemAndManually.bottom;
}

- (void)kafkaScrollViewContentOffsetDidChange:(CGPoint)contentOffset{
	if (self.refreshState != KafkaRefreshStateRefreshing) {
		if (self.isTriggeredRefreshByUser) return;
		
		CGFloat originY = 0.0, maxContentOffsetYThreshold = 0.0, minContentOffsetYThreshold = 0.0;
		if (self.scrollView.contentSize.height + self.adjustInsetsBySystemAndManually.top <= self.scrollView.kaf_height){
			maxContentOffsetYThreshold = self.stretchOffsetYAxisThreshold*self.kaf_height;
			minContentOffsetYThreshold = 0;
			originY = contentOffset.y + self.adjustInsetsBySystemAndManually.top; 
			if (self.refreshState == KafkaRefreshStateScrolling){
				CGFloat progress = fabs(originY)/self.kaf_height;
				progress = (progress <= self.stretchOffsetYAxisThreshold ? progress :self.stretchOffsetYAxisThreshold);
				self.progress = progress;
			}
		}else{
			maxContentOffsetYThreshold = max_content_offset_y_threshold(self);
			minContentOffsetYThreshold = min_content_offset_y_threshold(self);
			originY = contentOffset.y;
			///uncontinuous callback
			if (originY < minContentOffsetYThreshold - 50.0) return; 
			CGFloat contentOffsetBottom = self.scrollView.contentSize.height - self.scrollView.kaf_height;
			if (self.refreshState == KafkaRefreshStateScrolling){
				CGFloat progress = fabs((originY - contentOffsetBottom))/self.kaf_height;
				progress = (progress <= self.stretchOffsetYAxisThreshold ? progress:self.stretchOffsetYAxisThreshold);
				self.progress = progress;
			}
		}
		
		if (!self.scrollView.isDragging &&
			self.refreshState == KafkaRefreshStateReady){
			self.triggeredRefreshByUser = NO;
			self.refreshState = KafkaRefreshStateRefreshing;
			[self setScrollViewToRefreshLocation];
		}
		else if (originY <= minContentOffsetYThreshold && !self.isAnimating){
			self.refreshState = KafkaRefreshStateNone;
		}
		else if (self.scrollView.isDragging &&
				 originY >= minContentOffsetYThreshold &&
				 originY <= maxContentOffsetYThreshold &&
				 self.refreshState != KafkaRefreshStateScrolling){
			self.refreshState = KafkaRefreshStateScrolling;
		}
		else if (self.scrollView.isDragging &&
				 originY > maxContentOffsetYThreshold &&
				 self.refreshState != KafkaRefreshStateReady){
			self.refreshState = KafkaRefreshStateReady;
		}
	}
}

@end
