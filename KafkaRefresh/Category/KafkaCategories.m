/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/

#import "KafkaCategories.h"

@implementation UIView (KafkaLayout)

- (CGFloat)left {
	return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
	CGRect frame = self.frame;
	frame.origin.x = x;
	self.frame = frame;
}

- (CGFloat)top {
	return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
	CGRect frame = self.frame;
	frame.origin.y = y;
	self.frame = frame;
}

- (CGFloat)right {
	return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
	CGRect frame = self.frame;
	frame.origin.x = right - frame.size.width;
	self.frame = frame;
}

- (CGFloat)bottom {
	return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
	CGRect frame = self.frame;
	frame.origin.y = bottom - frame.size.height;
	self.frame = frame;
}

- (CGFloat)width {
	return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

- (CGFloat)height {
	return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
	CGRect frame = self.frame;
	frame.size.height = height;
	self.frame = frame;
}

- (CGFloat)centerX {
	return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
	self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
	return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
	self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
	return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
	CGRect frame = self.frame;
	frame.origin = origin;
	self.frame = frame;
}

- (CGSize)size {
	return self.frame.size;
}

- (void)setSize:(CGSize)size {
	CGRect frame = self.frame;
	frame.size = size;
	self.frame = frame;
}

@end

#pragma mark -

@implementation CALayer (KafkaLayout)

- (CGFloat)left{
	return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left{
	CGRect frame = self.frame;
	frame.origin.x = left;
	self.frame = frame;
}

- (CGFloat)top {
	return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
	CGRect frame = self.frame;
	frame.origin.y = y;
	self.frame = frame;
}

- (CGFloat)right {
	return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
	CGRect frame = self.frame;
	frame.origin.x = right - frame.size.width;
	self.frame = frame;
}

- (CGFloat)bottom {
	return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
	CGRect frame = self.frame;
	frame.origin.y = bottom - frame.size.height;
	self.frame = frame;
}

- (CGFloat)width {
	return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

- (CGFloat)height {
	return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
	CGRect frame = self.frame;
	frame.size.height = height;
	self.frame = frame;
}

- (CGFloat)positionX {
	return self.position.x;
}

- (void)setPositionX:(CGFloat)positionX {
	self.position = CGPointMake(positionX, self.position.y);
}

- (CGFloat)positionY {
	return self.position.y;
}

- (void)setPositionY:(CGFloat)positionY {
	self.position = CGPointMake(self.position.x, positionY);
}

- (CGPoint)origin {
	return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
	CGRect frame = self.frame;
	frame.origin = origin;
	self.frame = frame;
}

- (CGSize)size {
	return self.frame.size;
}

- (void)setSize:(CGSize)size {
	CGRect frame = self.frame;
	frame.size = size;
	self.frame = frame;
}

@end

#pragma mark -

@implementation UIScrollView (KafkaLayout)

- (CGFloat)offsetX{
	return self.contentOffset.x;
}

- (void)setOffsetX:(CGFloat)offsetX{
	CGPoint offset = self.contentOffset;
	offset.x = offsetX;
	self.contentOffset = offset;
}

- (CGFloat)offsetY{
	return self.contentOffset.y;
}

-(void)setOffsetY:(CGFloat)offsetY{
	CGPoint offset = self.contentOffset;
	offset.y = offsetY;
	self.contentOffset = offset;
}

- (CGFloat)insetTop{
	return self.realContentInset.top;
}

- (void)setInsetTop:(CGFloat)insetTop{
	UIEdgeInsets inset = self.contentInset;
	inset.top = insetTop;
	if (@available(iOS 11.0, *)) {
		inset.top -= (self.adjustedContentInset.top - self.contentInset.top);
	}
	self.contentInset = inset;
}

- (CGFloat)insetBottom{
	return self.realContentInset.bottom;
}

- (void)setInsetBottom:(CGFloat)insetBottom{
	UIEdgeInsets inset = self.contentInset;
	inset.bottom = insetBottom;
	if (@available(iOS 11.0, *)) {
		inset.bottom -= (self.adjustedContentInset.bottom - self.contentInset.bottom);
	}
	self.contentInset = inset;
}

- (CGFloat)contentHeight{
	return self.contentSize.height;
}

- (UIEdgeInsets)realContentInset{
	if (@available(iOS 11.0, *)) {
		return self.adjustedContentInset;
	} else {
		return self.contentInset;
	}
}

@end

#pragma mark -

@implementation NSObject (KafkaAnimation)

- (void)setAnimateBlock:(dispatch_block_t)block{
    [self setAnimateBlock:block completion:nil];
}

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


