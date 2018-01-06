/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/


#import <Foundation/Foundation.h>

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
