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

@interface KafkaArcLayer : CALayer<KafkaAnimatableProtocol>

@property (strong, nonatomic) UIColor * ringBackgroundColor;
@property (strong, nonatomic) UIColor * ringFillColor;

- (void)setProgress:(CGFloat)progress;

@end
