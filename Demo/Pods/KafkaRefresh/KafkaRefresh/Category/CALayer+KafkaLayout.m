/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/

#import "CALayer+KafkaLayout.h"

@implementation CALayer (KafkaLayout)

- (CGFloat)kaf_left{
	return self.frame.origin.x;
}

- (void)setKaf_left:(CGFloat)left{
	CGRect frame = self.frame;
	frame.origin.x = left;
	self.frame = frame;
}

- (CGFloat)kaf_top {
	return self.frame.origin.y;
}

- (void)setKaf_top:(CGFloat)y {
	CGRect frame = self.frame;
	frame.origin.y = y;
	self.frame = frame;
}

- (CGFloat)kaf_right {
	return self.frame.origin.x + self.frame.size.width;
}

- (void)setKaf_right:(CGFloat)right {
	CGRect frame = self.frame;
	frame.origin.x = right - frame.size.width;
	self.frame = frame;
}

- (CGFloat)kaf_bottom {
	return self.frame.origin.y + self.frame.size.height;
}

- (void)setKaf_bottom:(CGFloat)bottom {
	CGRect frame = self.frame;
	frame.origin.y = bottom - frame.size.height;
	self.frame = frame;
}

- (CGFloat)kaf_width {
	return self.frame.size.width;
}

- (void)setKaf_width:(CGFloat)width {
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

- (CGFloat)kaf_height {
	return self.frame.size.height;
}

- (void)setKaf_height:(CGFloat)height {
	CGRect frame = self.frame;
	frame.size.height = height;
	self.frame = frame;
}

- (CGFloat)kaf_positionX {
	return self.position.x;
}

- (void)setKaf_positionX:(CGFloat)positionX {
	self.position = CGPointMake(positionX, self.position.y);
}

- (CGFloat)kaf_positionY {
	return self.position.y;
}

- (void)setKaf_positionY:(CGFloat)positionY {
	self.position = CGPointMake(self.position.x, positionY);
}

- (CGPoint)kaf_origin {
	return self.frame.origin;
}

- (void)setKaf_origin:(CGPoint)origin {
	CGRect frame = self.frame;
	frame.origin = origin;
	self.frame = frame;
}

- (CGSize)kaf_size {
	return self.frame.size;
}

- (void)setKaf_size:(CGSize)size {
	CGRect frame = self.frame;
	frame.size = size;
	self.frame = frame;
}

@end
