/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/

#import <UIKit/UIKit.h>
#import "KafkaRefreshStyle.h"
#import "KafkaRefreshControl.h"

@interface UIScrollView (KafkaConfiguration)

- (void)bindGlobalStyleForHeadRefreshHandler:(KafkaRefreshHandler)block;
- (void)bindHeadRefreshHandler:(KafkaRefreshHandler)block themeColor:(UIColor *)color refreshStyle:(KafkaRefreshStyle)style;

- (void)bindGlobalStyleForFootRefreshHandler:(KafkaRefreshHandler)block; 
- (void)bindFootRefreshHandler:(KafkaRefreshHandler)block themeColor:(UIColor *)color refreshStyle:(KafkaRefreshStyle)style;

@end

#pragma mark - deprecated

@interface UIScrollView (KafakaDeprecated)

- (void)bindRefreshStyle:(KafkaRefreshStyle)style fillColor:(UIColor *)fillColor atPosition:(KafkaRefreshPosition)position refreshHanler:(KafkaRefreshHandler)handler __attribute__((deprecated("please use bindHeadRefreshHandler: themeColor: refreshStyle")));

- (void)bindRefreshStyle:(KafkaRefreshStyle)style fillColor:(UIColor *)fillColor animatedBackgroundColor:(UIColor *)backgroundColor atPosition:(KafkaRefreshPosition)position refreshHanler:(KafkaRefreshHandler)handler __attribute__((deprecated("please use bindHeadRefreshHandler: themeColor: refreshStyle")));

- (void)bindDefaultRefreshStyleAtPosition:(KafkaRefreshPosition)position refreshHanler:(KafkaRefreshHandler)handler __attribute__((deprecated("please use bindGlobalStyleForHeadRefreshHandler:")));

@end


