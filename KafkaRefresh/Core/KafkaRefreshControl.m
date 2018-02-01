/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/

#define KafkaColorWithRGBA(r,g,b,a)  \
[UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:(a)]

#import "KafkaRefreshControl.h"

@interface KafkaLabel : UILabel
- (void)startAnimating;
@end

@implementation KafkaLabel{
	CAGradientLayer * new;
}

- (instancetype)init{
	self = [super init];
	if (self) {
		new = [CAGradientLayer new];
		new.locations = @[@0.2,@0.5,@0.8];
		new.startPoint = CGPointMake(0, 0.5);
		new.endPoint = CGPointMake(1, 0.5);
		[self.layer addSublayer:new];
	}
	return self;
}

- (void)layoutSubviews{
	new.frame = CGRectMake(0, 0, 0, self.kaf_height);
	new.position = CGPointMake(self.kaf_width/2.0, self.kaf_height/2.);
}

- (void)startAnimating{
	[self setNeedsLayout];
	new.colors = @[(id)[self.textColor colorWithAlphaComponent:0.2].CGColor,
				   (id)[self.textColor colorWithAlphaComponent:0.1].CGColor,
				   (id)[self.textColor colorWithAlphaComponent:0.2].CGColor];
	
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
	animation.fromValue = @(0);
	animation.toValue = @(self.kaf_width);
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	animation.fillMode = kCAFillModeForwards;
	animation.duration = 0.3;
	animation.removedOnCompletion = NO;
	[new addAnimation:animation forKey:nil];
}

- (void)stopAnimating{
	[new removeAllAnimations];
}

@end

static NSString * const KafkaContentOffset = @"contentOffset";
static NSString * const KafkaContentSize = @"contentSize";

static CGFloat const KafkaRefreshHeight = 45.;
static CGFloat const kStretchOffsetYAxisThreshold = 1.0;

@interface KafkaRefreshControl()
@property (nonatomic, weak) __kindof UIScrollView *scrollView;
@property (nonatomic, getter=isRefresh) BOOL refresh;
@property (assign, nonatomic,getter=isObservering) BOOL observering;
@property (strong, nonatomic) KafkaLabel *alertLabel;
@property (assign, nonatomic, getter=isShouldNoLongerRefresh) BOOL shouldNoLongerRefresh;
@end

@implementation KafkaRefreshControl

- (instancetype)initWithFrame:(CGRect)frame{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupProperties];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
	self = [super initWithCoder:coder];
	if (self) {
		[self setupProperties];
	}
	return self;
}

- (void)setupProperties{
	self.backgroundColor = [UIColor whiteColor];
	self.alpha = 0.;
	[self addSubview:self.alertLabel];
	_refreshState = KafkaRefreshStateNone;
	_stretchOffsetYAxisThreshold = kStretchOffsetYAxisThreshold;
	_shouldNoLongerRefresh = NO;
	_refresh = NO;
	if (CGRectEqualToRect(self.frame, CGRectZero)) self.frame = CGRectMake(0, 0, 1, 1);
}

- (void)setFillColor:(UIColor *)fillColor{
	if (_fillColor != fillColor) {
		_fillColor =  fillColor;
		_alertLabel.textColor = fillColor;
	}
}

- (void)setRefreshState:(KafkaRefreshState)refreshState{
	if (_refreshState == refreshState) return;
	_refreshState = refreshState;
	switch (refreshState) {
		case KafkaRefreshStateNone:{
			__weak typeof(self) weakSelf = self;
			[self setAnimateBlock:^{
				weakSelf.alpha = 0.0;
			} completion:NULL];
			break;
		}
		case KafkaRefreshStateScrolling:{
			////////////////////////////////////////////////////////////////////////////////////
			///when system adjust contentOffset atuomatically,
			///will trigger refresh control's state changed.
			if (!self.isTriggeredRefreshByUser && !self.scrollView.isTracking) {
				return;
			}
			////////////////////////////////////////////////////////////////////////////////////
			__weak typeof(self) weakSelf = self;
			[self setAnimateBlock:^{
				weakSelf.alpha = 1.;
			} completion:NULL];
			break;
		}
		case KafkaRefreshStateReady:{
			////////////////////////////////////////////////////////////////////////////////////
			///because of scrollView contentOffset is not continuous change.
			///need to manually adjust progress
			if (self.progress < self.stretchOffsetYAxisThreshold) {
				[self kafkaDidScrollWithProgress:self.stretchOffsetYAxisThreshold max:self.stretchOffsetYAxisThreshold];
			}
			////////////////////////////////////////////////////////////////////////////////////
			__weak typeof(self) weakSelf = self;
			[self setAnimateBlock:^{
				weakSelf.alpha = 1.;
			} completion:NULL];
			break;
		}
		case KafkaRefreshStateRefreshing:{
			break;
		}
		case KafkaRefreshStateWillEndRefresh:{
			__weak typeof(self) weakSelf = self;
			[self setAnimateBlock:^{
				weakSelf.alpha = 1.;
			} completion:NULL];
			break; 
		}
	}
	[self kafkaRefreshStateDidChange:refreshState];
}

- (void)setProgress:(CGFloat)progress{
	if (_progress == progress) return;
	_progress = progress;
	[self kafkaDidScrollWithProgress:progress max:self.stretchOffsetYAxisThreshold];
}

- (void)setStretchOffsetYAxisThreshold:(CGFloat)stretchOffsetYAxisThreshold{
	if (_stretchOffsetYAxisThreshold != stretchOffsetYAxisThreshold &&
		stretchOffsetYAxisThreshold >= 1.0) {
		_stretchOffsetYAxisThreshold = stretchOffsetYAxisThreshold;
	}
}

- (BOOL)isRefresh{ 
	return (_refreshState == KafkaRefreshStateRefreshing);
}

#pragma mark - layout

- (void)layoutSubviews{
	[super layoutSubviews];
	
	self.kaf_height = (self.kaf_height < 45.) ? KafkaRefreshHeight : self.kaf_height;
	self.frame = CGRectMake(0, 0, self.scrollView.kaf_width, self.kaf_height);
	self.alertLabel.frame = self.bounds;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
	NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
	if (self.superview && newSuperview == nil) {
		if (_observering) {
			[self.superview removeObserver:self forKeyPath:KafkaContentOffset];
			[self.superview removeObserver:self forKeyPath:KafkaContentSize];
			_observering = NO;
		}
	}
	else if (self.superview == nil && newSuperview){
		if (!_observering) {
			_scrollView = (UIScrollView *)newSuperview;
			/////////////////////////////////////////////////////////////////////////////////////////
			//sometimes, this method called before `layoutSubviews`,such as UICollectionViewController
			[self layoutIfNeeded];
			/////////////////////////////////////////////////////////////////////////////////////////
			_adjustInsetsBySystemAndManually = ((UIScrollView *)newSuperview).realContentInset;
			[newSuperview addObserver:self forKeyPath:KafkaContentOffset options:options context:nil];
			[newSuperview addObserver:self forKeyPath:KafkaContentSize options:options context:nil];
			_observering = YES;
		}
	}
}
  
- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary<NSKeyValueChangeKey,id> *)change
					   context:(void *)context{
	if ([keyPath isEqualToString:KafkaContentOffset]) {
		///////////////////////////////////////////////////////////////////////////////////////////
		//If you disable the control's refresh feature, set the control to hidden
		if (self.isHidden) return;
		///////////////////////////////////////////////////////////////////////////////////////////
		
		CGPoint point = [[change valueForKey:NSKeyValueChangeNewKey] CGPointValue];
		///////////////////////////////////////////////////////////////////////////////////////////
		//If you quickly scroll scrollview in an instant, contentoffset changes are not continuous
		///////////////////////////////////////////////////////////////////////////////////////////
		[self kafkaScrollViewContentOffsetDidChange:point];
	}
	else if([keyPath isEqualToString:KafkaContentSize]){
		[self layoutSubviews];
	}
}

- (void)kafkaScrollViewContentOffsetDidChange:(CGPoint)contentOffset{}
 
- (void)beginRefreshing{
	if (self.refreshState != KafkaRefreshStateNone || self.isHidden) return;
	self.shouldNoLongerRefresh = NO;
	self.triggeredRefreshByUser = YES;
	[self setScrollViewToRefreshLocation];
}

- (void)setScrollViewToRefreshLocation{
	self.animating = YES;
}

- (void)endRefreshing{
	[self endRefreshingWithAlertText:nil completion:nil];
}

- (void)endRefreshingWithAlertText:(NSString *)text completion:(dispatch_block_t)completion {
	if((!self.isRefresh && !self.isAnimating) || self.isHidden) return;
	[self kafkaRefreshStateDidChange:KafkaRefreshStateWillEndRefresh];
	if (text) {
		self.alertLabel.hidden = NO;
		[self bringSubviewToFront:self.alertLabel];
		self.alertLabel.text = text;
		[self.alertLabel setNeedsLayout];
		[self.alertLabel startAnimating];
		__weak typeof(self) weakSelf = self;
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			weakSelf.alertLabel.hidden = TRUE;
			[weakSelf.alertLabel stopAnimating];
			[weakSelf _endRefresh];
			if (completion) completion(); 
		});
	}else{
		[self _endRefresh];
	}
}

- (void)endRefreshingAndNoLongerRefreshingWithAlertText:(NSString *)text{
	if (self.isShouldNoLongerRefresh) return;
	self.shouldNoLongerRefresh = YES;
	if (self.alertLabel.isHidden) self.alertLabel.hidden = NO;
	[self bringSubviewToFront:self.alertLabel];
	self.alertLabel.text = text;
	__weak typeof(self) weakSelf = self;
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[weakSelf _endRefresh];
	});
}

- (void)_endRefresh{
	self.refreshState = KafkaRefreshStateScrolling;
	[self setScrollViewToOriginalLocation];
}

- (void)setScrollViewToOriginalLocation{}

#pragma mark -

#pragma mark - progress callback

- (void)kafkaRefreshStateDidChange:(KafkaRefreshState)state{}

- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max{}

#pragma mark - getter

- (KafkaLabel *)alertLabel{
	if (!_alertLabel) {
		_alertLabel = [KafkaLabel new];
		_alertLabel.textAlignment = NSTextAlignmentCenter;
		_alertLabel.font =  [UIFont fontWithName:@"Helvetica" size:15.f];
		_alertLabel.textColor = _fillColor;
		_alertLabel.hidden = TRUE;
		_alertLabel.backgroundColor = [UIColor whiteColor];
	}
	return _alertLabel;
}

@end
