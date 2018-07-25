/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * Email:xorshine@icloud.com
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaArcLayer.h"
#import "KafkaCategories.h"

#define KafkaColorWithRGBA(r,g,b,a)  \
[UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:(a)]

@interface KafkaArcLayer()

@property (strong, nonatomic) CAShapeLayer * ringBackgroundLayer;
@property (strong, nonatomic) CAShapeLayer * ringShapeLayer;
@property (strong, nonatomic) UIBezierPath * bezierPath;

@end

@implementation KafkaArcLayer

- (instancetype)init{
	self = [super init];
	if (self) {
		_ringFillColor = KafkaColorWithRGBA(180., 180., 180., 1.0);
		_ringBackgroundColor = KafkaColorWithRGBA(230., 230., 230., 1.0);
		
		[self addSublayer:self.ringBackgroundLayer];
		[self.ringBackgroundLayer addSublayer:self.ringShapeLayer];
	}
	return self;
}

- (void)startAnimating{
	
}

- (void)stopAnimating{
	self.ringShapeLayer.strokeEnd = 0.0;
	[self.ringShapeLayer removeAllAnimations];
}

- (void)setProgress:(CGFloat)progress{
	self.ringShapeLayer.strokeEnd = progress;
}

- (void)setRingFillColor:(UIColor *)ringFillColor{
	_ringFillColor = ringFillColor;
	self.ringShapeLayer.strokeColor = ringFillColor.CGColor;
}

- (void)setRingBackgroundColor:(UIColor *)ringBackgroundColor{ 
	_ringBackgroundColor = ringBackgroundColor;
	self.ringBackgroundLayer.strokeColor = ringBackgroundColor.CGColor;
}

- (void)layoutSublayers{
	[super layoutSublayers];
	
	self.ringBackgroundLayer.frame = CGRectMake(0, 0, 30, 30);
	self.ringBackgroundLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
	
	self.ringShapeLayer.frame = self.ringBackgroundLayer.bounds;
	self.ringShapeLayer.position = CGPointMake(CGRectGetMidX(self.ringBackgroundLayer.bounds), CGRectGetMidY(self.ringBackgroundLayer.bounds));
	
	self.bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.ringShapeLayer.bounds cornerRadius:self.ringShapeLayer.kr_width/2.];
	
	self.ringBackgroundLayer.path = self.bezierPath.CGPath;
	self.ringShapeLayer.path = self.bezierPath.CGPath;
}

- (CAShapeLayer *)ringBackgroundLayer{
	if (!_ringBackgroundLayer) {
		_ringBackgroundLayer = [CAShapeLayer layer];
		_ringBackgroundLayer.lineWidth = 3.;
		_ringBackgroundLayer.lineCap = kCALineCapRound;
		_ringBackgroundLayer.backgroundColor = [UIColor clearColor].CGColor;
		_ringBackgroundLayer.fillColor = [UIColor clearColor].CGColor;
		_ringBackgroundLayer.strokeColor = self.ringBackgroundColor.CGColor;
	}
	return _ringBackgroundLayer;
}

- (CAShapeLayer *)ringShapeLayer{
	if (!_ringShapeLayer) {
		_ringShapeLayer = [CAShapeLayer layer];
		_ringShapeLayer.lineWidth = 3.;
		_ringShapeLayer.lineCap = kCALineCapRound;
		_ringShapeLayer.backgroundColor = [UIColor clearColor].CGColor;
		_ringShapeLayer.fillColor = [UIColor clearColor].CGColor;
		_ringShapeLayer.strokeColor = self.ringFillColor.CGColor;
		_ringShapeLayer.strokeEnd = 0;
	}
	return _ringShapeLayer;
}

@end
