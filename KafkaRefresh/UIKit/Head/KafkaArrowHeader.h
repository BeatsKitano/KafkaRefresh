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

@interface KafkaArrowHeader : KafkaHeadRefreshControl

/**
 Foot drag to display the text
 */
@property (copy, nonatomic) NSString * pullingText;

/**
 The text displayed when you release your finger before releasing it
 */
@property (copy, nonatomic) NSString * readyText;

/**
 Text displayed on refresh
 */
@property (copy, nonatomic) NSString * refreshingText;

@end
