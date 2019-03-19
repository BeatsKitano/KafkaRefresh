/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * Email:xorshine@icloud.com
 *
 * This source code is licensed under the MIT license.
 */

#define KafkaColorWithRGBA(r,g,b,a)  \
[UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:(a)]

#import "KafkaReplicatorLayer.h" 
#import "KafkaCategories.h"
#import "KafkaRefreshDefaults.h"
#import <objc/runtime.h>

static void * KafkaLeftDot = &KafkaLeftDot;
static void * KafkaRightDot = &KafkaRightDot;

@implementation KafkaReplicatorLayer

- (instancetype)init{
	self = [super init];
	if (self) {
		[self setupProperties];
	}
	return self;
}

- (void)setupProperties{
	[self addSublayer:self.replicatorLayer];
	[self.replicatorLayer addSublayer:self.indicatorShapeLayer];
    self.indicatorShapeLayer.strokeColor = [KafkaRefreshDefaults standardRefreshDefaults].themeColor.CGColor;
    self.indicatorShapeLayer.backgroundColor = [KafkaRefreshDefaults standardRefreshDefaults].backgroundColor.CGColor;
}

- (void)setAnimationStyle:(KafkaReplicatorLayerAnimationStyle)animationStyle{
	if (_animationStyle != animationStyle) {
		_animationStyle = animationStyle;
		[self setNeedsLayout];
	}
}

- (void)setThemeColor:(UIColor *)themeColor{
    _themeColor = themeColor;
    self.indicatorShapeLayer.strokeColor = themeColor.CGColor;
    self.indicatorShapeLayer.backgroundColor = themeColor.CGColor;
} 

- (void)layoutSublayers {
	[super layoutSublayers];
	
	self.replicatorLayer.frame = self.bounds;
	
	CGFloat padding = 10.;
	switch (self.animationStyle) {
		case KafkaReplicatorLayerAnimationStyleWoody:
		case KafkaReplicatorLayerAnimationStyleAllen:{
			CGFloat h = self.kr_height / 3.0;
			CGFloat w = 3.0;
			CGFloat x = self.kr_width / 2. - (2.5 * w + padding * 2);
			CGFloat y = self.kr_height / 2. - h / 2.0;
			self.indicatorShapeLayer.frame = CGRectMake(x, y, w, h);
			self.indicatorShapeLayer.cornerRadius = 1.;
			
			self.replicatorLayer.instanceCount = 5;
			self.replicatorLayer.instanceDelay = 0.3/5;
			self.replicatorLayer.instanceTransform = CATransform3DMakeTranslation(padding+w, 0.0, 0.0);
			self.replicatorLayer.instanceBlueOffset = -0.01;
			self.replicatorLayer.instanceGreenOffset = -0.01;
			break;
		}
		case KafkaReplicatorLayerAnimationStyleCircle:{
			self.indicatorShapeLayer.frame = CGRectMake(self.kr_width/2. - 2., 10, 4., 4.);
			self.indicatorShapeLayer.cornerRadius = 2.;
			self.indicatorShapeLayer.transform = CATransform3DMakeScale(0.2, 0.2, 0.2);
			
			self.replicatorLayer.instanceCount = 12;
			self.replicatorLayer.instanceDelay = 0.8/12;
			CGFloat angle = (2 * M_PI)/self.replicatorLayer.instanceCount;
			self.replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 0.1);
			self.replicatorLayer.instanceBlueOffset = -0.01;
			self.replicatorLayer.instanceGreenOffset = -0.01;
			break;
		}
		case KafkaReplicatorLayerAnimationStyleDot:{
			CGFloat innerPadding = 30.;
			CGFloat h = 8.0;;
			CGFloat w = 8.0;
			CGFloat x = self.kr_width / 2. - (.5 * w + innerPadding);
			CGFloat y = self.kr_height/2. - h/2.0;
			self.indicatorShapeLayer.frame = CGRectMake(x, y, w, h);
			self.indicatorShapeLayer.cornerRadius = 4.;
			
			self.replicatorLayer.instanceCount = 3;
			self.replicatorLayer.instanceDelay = 0.5/3;
			self.replicatorLayer.instanceTransform = CATransform3DMakeTranslation(innerPadding, 0.0, 0.0);
			break;
		}
		case KafkaReplicatorLayerAnimationStyleArc:{
			CGFloat h = self.kr_height - 10.;
			CGFloat w = h;
			CGFloat x = self.kr_width/2. - 0.5 * w;
			CGFloat y = self.kr_height/2.- h/2.0;
			self.indicatorShapeLayer.frame = CGRectMake(x, y, w, h);
            self.indicatorShapeLayer.fillColor = [UIColor clearColor].CGColor;
			self.indicatorShapeLayer.lineWidth = 3.;
            self.indicatorShapeLayer.backgroundColor = [UIColor clearColor].CGColor;
            
			UIBezierPath *arcPath = [UIBezierPath bezierPath];
			[arcPath addArcWithCenter:CGPointMake(w/2.0, h/2.)
							   radius:h/2.
						   startAngle:M_PI/2.3
							 endAngle:-M_PI/2.3
							clockwise:NO];
			self.indicatorShapeLayer.path = arcPath.CGPath;
			self.indicatorShapeLayer.strokeEnd = 0.1;
			self.replicatorLayer.instanceCount = 2;
			self.replicatorLayer.instanceTransform = CATransform3DMakeRotation(M_PI, 0, 0, 0.1);
			break;
		}
		case KafkaReplicatorLayerAnimationStyleTriangle:{
            CGFloat h = 8.0;
            CGFloat w = h;
			self.indicatorShapeLayer.frame = CGRectMake(self.replicatorLayer.kr_width/2.-w/2, 5., w, h);
			self.indicatorShapeLayer.cornerRadius = self.indicatorShapeLayer.kr_width/2.;
			CGPoint topPoint = self.indicatorShapeLayer.position;
			CGPoint leftPoint = CGPointMake(topPoint.x-15, topPoint.y+23);
			CGPoint rightPoint = CGPointMake(topPoint.x+15, topPoint.y+23);
			
			CAShapeLayer *leftCircle = [self leftCircle];
			CAShapeLayer *rightCircle = [self rightCircle];
			if (leftCircle)
				[leftCircle removeFromSuperlayer];
			if (rightCircle)
				[rightCircle removeFromSuperlayer];
			
			leftCircle.kr_size = self.indicatorShapeLayer.kr_size;
			leftCircle.position = leftPoint;
			leftCircle.cornerRadius = self.indicatorShapeLayer.cornerRadius;
			[self.replicatorLayer addSublayer:leftCircle];
			 
			rightCircle.kr_size = self.indicatorShapeLayer.kr_size;
			rightCircle.position = rightPoint;
			rightCircle.cornerRadius = self.indicatorShapeLayer.cornerRadius;
			[self.replicatorLayer addSublayer:rightCircle];
			break;
		}
	}
}

- (void)startAnimating{
	[self.indicatorShapeLayer removeAllAnimations];
	switch (self.animationStyle) {
		case KafkaReplicatorLayerAnimationStyleWoody:{
			CABasicAnimation *basicAnimation = [self animationKeyPath:@"transform.scale.y"
																 from:@(1.5)
																   to:@(0.0)
															 duration:0.3
														   repeatTime:INFINITY];
			basicAnimation.autoreverses = YES;
			[self.indicatorShapeLayer addAnimation:basicAnimation forKey:basicAnimation.keyPath];
			break;
		}
		case KafkaReplicatorLayerAnimationStyleAllen:{
			CABasicAnimation *basicAnimation = [self animationKeyPath:@"position.y"
																 from:@(self.indicatorShapeLayer.position.y+10)
																   to:@(self.indicatorShapeLayer.position.y-10)
															 duration:0.3
														   repeatTime:INFINITY];
			basicAnimation.autoreverses = YES;
			[self.indicatorShapeLayer addAnimation:basicAnimation forKey:basicAnimation.keyPath]; 
			break;
		}
		case KafkaReplicatorLayerAnimationStyleCircle:{
			CABasicAnimation *basicAnimation = [self animationKeyPath:@"transform.scale"
																 from:@(1.0)
																   to:@(0.2)
															 duration:0.8
														   repeatTime:INFINITY];
			[self.indicatorShapeLayer addAnimation:basicAnimation forKey:basicAnimation.keyPath];
			break;
		}
		case KafkaReplicatorLayerAnimationStyleDot:{
			CABasicAnimation *basicAnimation = [self animationKeyPath:@"transform.scale"
																 from:@(0.3)
																   to:@(2.5)
															 duration:0.5
														   repeatTime:INFINITY];
			basicAnimation.autoreverses = YES;
			CABasicAnimation * opc = [self animationKeyPath:@"opacity"
													   from:@(0.1)
														 to:@(1.0)
												   duration:0.5
												 repeatTime:INFINITY];
			
			opc.autoreverses = YES;
			CAAnimationGroup * group = [CAAnimationGroup animation];
			group.animations = @[basicAnimation,opc];
			group.autoreverses = YES;
			group.repeatCount = INFINITY;
			group.duration = 0.5;
			[self.indicatorShapeLayer addAnimation:group forKey:basicAnimation.keyPath];
			break;
		}
		case KafkaReplicatorLayerAnimationStyleArc:{
			CABasicAnimation *basicAnimation = [self animationKeyPath:@"transform.rotation.z"
																 from:@(0.0)
																   to:@(2*M_PI)
															 duration:0.8
														   repeatTime:INFINITY];
			[self.indicatorShapeLayer addAnimation:basicAnimation forKey:basicAnimation.keyPath];
			break;
		}
		case KafkaReplicatorLayerAnimationStyleTriangle:{
			CAShapeLayer *leftCircle = objc_getAssociatedObject(self, KafkaLeftDot);
			CAShapeLayer *rightCircle = objc_getAssociatedObject(self, KafkaRightDot);
			
			CGPoint topPoint = self.indicatorShapeLayer.position;
			CGPoint leftPoint = leftCircle.position;
			CGPoint rightPoint = rightCircle.position;
			
			NSArray *vertexs = @[[NSValue valueWithCGPoint:topPoint],
								 [NSValue valueWithCGPoint:leftPoint],
								 [NSValue valueWithCGPoint:rightPoint]];
			
			CAKeyframeAnimation *key0 = [self keyFrameAnimationWithPath:[self trianglePathWithStartPoint:topPoint vertexs:vertexs] duration:1.5];
			[self.indicatorShapeLayer addAnimation:key0 forKey:key0.keyPath];
			
			CAKeyframeAnimation *key1 = [self keyFrameAnimationWithPath:[self trianglePathWithStartPoint:leftPoint vertexs:vertexs] duration:1.5];
			[rightCircle addAnimation:key1 forKey:key1.keyPath];
			
			CAKeyframeAnimation *key2 = [self keyFrameAnimationWithPath:[self trianglePathWithStartPoint:rightPoint vertexs:vertexs] duration:1.5];
			[leftCircle addAnimation:key2 forKey:key2.keyPath];
			break;
		}
	}
}

- (void)stopAnimating{
	[self.indicatorShapeLayer removeAllAnimations];
	
	switch (self.animationStyle) {
		case KafkaReplicatorLayerAnimationStyleWoody:
		case KafkaReplicatorLayerAnimationStyleAllen:
		case KafkaReplicatorLayerAnimationStyleCircle:
		case KafkaReplicatorLayerAnimationStyleDot:{
			break;
		}
		case KafkaReplicatorLayerAnimationStyleArc:{
			self.indicatorShapeLayer.strokeEnd = 0.1;
			break;
		}
		case KafkaReplicatorLayerAnimationStyleTriangle:{
			CAShapeLayer *leftCircle = objc_getAssociatedObject(self, KafkaLeftDot);
			[leftCircle removeAllAnimations];
			CAShapeLayer *rightCircle = objc_getAssociatedObject(self, KafkaRightDot);
			[rightCircle removeAllAnimations];
			break;
		}
	}
	
}

- (CABasicAnimation *)animationKeyPath:(NSString *)keyPath
									   from:(NSNumber *)fromValue
									  to:(NSNumber *)toValue
								duration:(CFTimeInterval)duration
							  repeatTime:(CGFloat)repeat {
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
	animation.fromValue = fromValue;
	animation.toValue = toValue;
	animation.duration = duration;
	animation.repeatCount = repeat;
	animation.removedOnCompletion = NO;
	return animation;
}

- (CAKeyframeAnimation *)keyFrameAnimationWithPath:(UIBezierPath *)path
										  duration:(NSTimeInterval)duration {
	CAKeyframeAnimation *animation = [[CAKeyframeAnimation alloc] init];
	animation.keyPath = @"position";
	animation.path = path.CGPath;
	animation.duration = duration;
	animation.repeatCount = INFINITY;
	animation.removedOnCompletion = NO;
	return animation;
}

- (UIBezierPath *)trianglePathWithStartPoint:(CGPoint)startPoint vertexs:(NSArray *)vertexs {
	CGPoint topPoint  = [[vertexs objectAtIndex:0] CGPointValue];
	CGPoint leftPoint  = [[vertexs objectAtIndex:1] CGPointValue];
	CGPoint rightPoint  = [[vertexs objectAtIndex:2] CGPointValue];
	
	UIBezierPath *path = [UIBezierPath bezierPath];
	
	if (CGPointEqualToPoint(startPoint, topPoint) ) {
		[path moveToPoint:startPoint];
		[path addLineToPoint:rightPoint];
		[path addLineToPoint:leftPoint];
	} else if (CGPointEqualToPoint(startPoint, leftPoint)) {
		[path moveToPoint:startPoint];
		[path addLineToPoint:topPoint];
		[path addLineToPoint:rightPoint];
	} else {
		[path moveToPoint:startPoint];
		[path addLineToPoint:leftPoint];
		[path addLineToPoint:topPoint];
	}
	
	[path closePath];
	
	return path;
}

- (CAShapeLayer *)leftCircle{
	CAShapeLayer *leftCircle = objc_getAssociatedObject(self, KafkaLeftDot);
	if (!leftCircle) {
		leftCircle = [CAShapeLayer layer];
		leftCircle.backgroundColor = self.indicatorShapeLayer.backgroundColor;
		objc_setAssociatedObject(self, KafkaLeftDot, leftCircle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
	return leftCircle;
}

- (CAShapeLayer *)rightCircle{
	CAShapeLayer *rightCircle = objc_getAssociatedObject(self, KafkaRightDot);
	if (!rightCircle) {
		rightCircle = [CAShapeLayer layer];
		rightCircle.backgroundColor = self.indicatorShapeLayer.backgroundColor;
		objc_setAssociatedObject(self, KafkaRightDot, rightCircle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
	return rightCircle;
}

- (CAShapeLayer *)indicatorShapeLayer{
	if (!_indicatorShapeLayer) {
		_indicatorShapeLayer = [CAShapeLayer layer];
		_indicatorShapeLayer.contentsScale = [[UIScreen mainScreen] scale];
        _indicatorShapeLayer.lineCap = kCALineCapRound;
	}
	return _indicatorShapeLayer;
}

- (CAReplicatorLayer *)replicatorLayer{
	if (!_replicatorLayer) {
		_replicatorLayer = [CAReplicatorLayer layer];
		_replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
		_replicatorLayer.shouldRasterize = YES;
		_replicatorLayer.rasterizationScale = [[UIScreen mainScreen] scale];
	}
	return _replicatorLayer;
}

@end
