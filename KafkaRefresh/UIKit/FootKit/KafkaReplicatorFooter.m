/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xorshine@icloud.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaReplicatorFooter.h"
#import "KafkaCategories.h"

@implementation KafkaReplicatorFooter

- (void)setupProperties{
	[super setupProperties];
	[self.layer addSublayer:self.replicatorLayer];
}

- (void)layoutSubviews{
	[super layoutSubviews];
	self.replicatorLayer.frame = CGRectMake(0, 0, self.kr_width, self.kr_height);
}

- (void)setThemeColor:(UIColor *)themeColor{
	[super setThemeColor:themeColor];
	self.replicatorLayer.themeColor = themeColor;
}

- (void)setAnimationStyle:(KafkaReplicatorLayerAnimationStyle)animationStyle{
	_animationStyle = animationStyle;
	self.replicatorLayer.animationStyle = animationStyle;
}

- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max{
#define kOffset 0.7
	if (progress >= 0.8) {
		progress = (progress-kOffset)/(max - kOffset);
	}
	switch (self.animationStyle) {
		case KafkaReplicatorLayerAnimationStyleWoody:{
			break;
		}
		case KafkaReplicatorLayerAnimationStyleAllen:{
			
			break;
		}
		case KafkaReplicatorLayerAnimationStyleCircle:{
			
			break;
		}
		case KafkaReplicatorLayerAnimationStyleDot:{
			
			break;
		}
		case KafkaReplicatorLayerAnimationStyleArc:{
			self.replicatorLayer.indicatorShapeLayer.strokeEnd = progress;
			break;
		}
		case KafkaReplicatorLayerAnimationStyleTriangle:{
			
			break;
		}
	}
}

- (void)kafkaRefreshStateDidChange:(KafkaRefreshState)state{
	[super kafkaRefreshStateDidChange:state];
	switch (state) {
		case KafkaRefreshStateNone:{
			break;
		}
		case KafkaRefreshStateScrolling:{
			break;
		}
		case KafkaRefreshStateReady:{
			self.replicatorLayer.opacity = 1.;
			break;
		}
		case KafkaRefreshStateRefreshing:{
			[self.replicatorLayer startAnimating];
			break;
		}
		case KafkaRefreshStateWillEndRefresh:{
			[self.replicatorLayer stopAnimating];
			break;
		} 
	}
}
 
- (KafkaReplicatorLayer *)replicatorLayer{
	if (!_replicatorLayer) {
		_replicatorLayer = [KafkaReplicatorLayer layer];
	}
	return _replicatorLayer;
}

@end
