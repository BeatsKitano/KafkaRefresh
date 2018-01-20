/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/


#import <QuartzCore/QuartzCore.h>

@interface CALayer (KafkaLayout)

@property (nonatomic) CGFloat kaf_left;
@property (nonatomic) CGFloat kaf_top;
@property (nonatomic) CGFloat kaf_right;
@property (nonatomic) CGFloat kaf_bottom;
@property (nonatomic) CGFloat kaf_width;
@property (nonatomic) CGFloat kaf_height;
@property (nonatomic) CGPoint kaf_origin;
@property (nonatomic) CGSize  kaf_size;
@property (nonatomic) CGFloat kaf_positionX;
@property (nonatomic) CGFloat kaf_positionY;

@end
