/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * Email:xorshine@icloud.com
 *
 * This source code is licensed under the MIT license.
 */

#import <UIKit/UIKit.h>
#import "KafkaRefreshStyle.h"

/**
 Global configuration class
 */
@interface KafkaRefreshDefaults : NSObject

/**
 Return a singleton
 */
+ (instancetype)standardRefreshDefaults;

/**
 Head refresh control style
 */
@property (assign, nonatomic) KafkaRefreshStyle headDefaultStyle;

/**
 Foot refresh control style
 */
@property (assign, nonatomic) KafkaRefreshStyle footDefaultStyle;

/**
 default R G B --> 28.  164.  252.
 */
@property (strong, nonatomic) UIColor * themeColor;

/**
 refresh control‘s backgroundColor
 */
@property (strong, nonatomic) UIColor * backgroundColor;

/**
 Head drag to display the text
 */
@property (copy, nonatomic) NSString * headPullingText;

/**
 Foot drag to display the text
 */
@property (copy, nonatomic) NSString * footPullingText;

/**
 The text displayed when you release your finger before releasing it
 */
@property (copy, nonatomic) NSString * readyText;

/**
 Text displayed on refresh
 */
@property (copy, nonatomic) NSString * refreshingText;

@end
