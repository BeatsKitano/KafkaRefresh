/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/


#import "NSObject+KafkaAnimation.h"
#import <UIKit/UIKit.h>

@implementation NSObject (KafkaAnimation)

- (void)setAnimateBlock:(dispatch_block_t)block completion:(dispatch_block_t)completion{
	[UIView animateWithDuration:0.15
						  delay:0
						options:UIViewAnimationOptionCurveLinear
					 animations:block
					 completion:^(BOOL finished) {
						 if (completion) completion();
					 }];
}

@end
