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

@interface UIScrollView (KafkaLayout)

@property (nonatomic) CGFloat offsetX;
@property (nonatomic) CGFloat offsetY;

@property (nonatomic) CGFloat insetTop;
@property (nonatomic) CGFloat insetBottom;

@property (nonatomic, readonly) CGFloat contentHeight;

/**
 scrollView's contentInset not refreshed
 */
@property (assign, readonly) UIEdgeInsets realContentInset;

@end
