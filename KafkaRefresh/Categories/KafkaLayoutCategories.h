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

@interface NSObject (KafkaAnimation)

/**
 [UIView animateWithDuration:0.25
					   delay:0
					 options:UIViewAnimationOptionCurveLinear
				  animations:block
				  completion:^(BOOL finished) {
				if (completion) completion();
 }];
 */
- (void)setAnimateBlock:(dispatch_block_t)block completion:(dispatch_block_t)completion;

@end

#pragma mark -

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

@end

#pragma mark - 

@interface UIScrollView (KafkaLayout)

@property (nonatomic) CGFloat offsetX;
@property (nonatomic) CGFloat offsetY;

@property (nonatomic) CGFloat insetTop;
@property (nonatomic) CGFloat insetBottom;

/**
 scrollView's contentInset not refreshed
 */
@property (assign, readonly) UIEdgeInsets realContentInset;

@end
