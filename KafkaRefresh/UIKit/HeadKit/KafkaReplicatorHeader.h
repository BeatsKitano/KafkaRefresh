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
#import "KafkaReplicatorLayer.h"

@interface KafkaReplicatorHeader : KafkaHeadRefreshControl

@property (strong, nonatomic) KafkaReplicatorLayer * replicatorLayer;
@property (assign, nonatomic) KafkaReplicatorLayerAnimationStyle animationStyle;

@end
