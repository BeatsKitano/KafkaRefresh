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
#import <UIKit/UIKit.h>

#ifndef weakify
# define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#endif 

#ifndef strongify
# define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#endif

#ifndef UIColorMake
# define UIColorMake(r, g, b, a) [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:(a)]
#endif

@interface UIView (KafkaLayout)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize  size;

@end

#pragma mark - 

@interface CALayer (KafkaLayout)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize  size;
@property (nonatomic) CGFloat positionX;
@property (nonatomic) CGFloat positionY;

@end

#pragma mark -

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

#pragma mark -

@interface NSObject (KafkaAnimation)

- (void)setAnimateBlock:(dispatch_block_t)block;
- (void)setAnimateBlock:(dispatch_block_t)block completion:(dispatch_block_t)completion;

@end
