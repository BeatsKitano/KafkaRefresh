/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * Email:xorshine@icloud.com
 *
 * This source code is licensed under the MIT license.
 */

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "KafkaAnimatableProtocol.h"

typedef NS_ENUM(NSInteger,KafkaReplicatorLayerAnimationStyle) {
	KafkaReplicatorLayerAnimationStyleWoody,
	KafkaReplicatorLayerAnimationStyleAllen,
	KafkaReplicatorLayerAnimationStyleCircle,
	KafkaReplicatorLayerAnimationStyleDot,
	KafkaReplicatorLayerAnimationStyleArc,
	KafkaReplicatorLayerAnimationStyleTriangle
};

@interface KafkaReplicatorLayer : CALayer<KafkaAnimatableProtocol>

@property (strong, nonatomic) CAReplicatorLayer *replicatorLayer;
@property (strong, nonatomic) CAShapeLayer *indicatorShapeLayer; 

@property (assign, nonatomic) KafkaReplicatorLayerAnimationStyle animationStyle;
@property (nonatomic, strong) UIColor *themeColor;

@end
