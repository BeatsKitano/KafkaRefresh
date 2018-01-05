/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xorshine@icloud.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaHeaderRefreshControl.h"
#import "KafkaArcLayer.h"

@interface KafkaRingIndicatorHeader : KafkaHeaderRefreshControl

@property (strong, nonatomic) KafkaArcLayer * arcLayer;
@property (strong, nonatomic) UIActivityIndicatorView * indicator;

@end
