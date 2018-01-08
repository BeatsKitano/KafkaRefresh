/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/

#import "UIScrollView+KafkaLayout.h"

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
	self.contentInset = inset;
}

- (CGFloat)insetBottom{
	return self.realContentInset.bottom;
}

- (void)setInsetBottom:(CGFloat)insetBottom{
	UIEdgeInsets inset = self.contentInset;
	inset.bottom = insetBottom;
	self.contentInset = inset;
}

- (UIEdgeInsets)realContentInset{
	if (@available(iOS 11.0, *)) {
		return self.adjustedContentInset;
	} else {
		return self.contentInset;
	}
}

@end
