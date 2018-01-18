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

static NSString * const KafkaContentOffset = @"contentOffset";
static NSString * const KafkaContentSize = @"contentSize";

static CGFloat const KafkaRefreshHeight = 45.;
static CGFloat const kStretchOffsetYAxisThreshold = 1.3;

@interface KafkaRefreshControl()

@property (nonatomic, weak) __kindof UIScrollView *scrollView;
@property (nonatomic, getter=isRefresh) BOOL refresh;
@property (assign, nonatomic,getter=isObservering) BOOL observering; 

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
	_refreshState = KafkaRefreshStateNone;
	_stretchOffsetYAxisThreshold = kStretchOffsetYAxisThreshold; 
	_refresh = NO;
	_shouldRefreshWhenDisplayed = NO; 
	if (CGRectEqualToRect(self.frame, CGRectZero)) self.frame = CGRectMake(0, 0, 1, 1);
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
			///when system adjust contentOffset atuomatically,
			///will trigger refresh control's state changed.
			if (!self.isTriggeredRefreshByUser && !self.scrollView.isTracking) {
				return;
			}
			__weak typeof(self) weakSelf = self;
			[self setAnimateBlock:^{
				weakSelf.alpha = 1.;
			} completion:NULL];
			break;
		}
		case KafkaRefreshStateReady:{
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
	return _refreshState == KafkaRefreshStateRefreshing;
}

#pragma mark - layout

- (void)layoutSubviews{
	[super layoutSubviews];
	
	self.kaf_height = (self.kaf_height < 45.) ? KafkaRefreshHeight : self.kaf_height;
	self.frame = CGRectMake(0, 0, self.scrollView.kaf_width, self.kaf_height);
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
			//////////////////////////////////////////////////////////////////////////
			//sometimes, this method called before `layoutSubviews`,such as UICollectionViewController
			[self layoutIfNeeded];
			//////////////////////////////////////////////////////////////////////////
			_adjustInsetsBySystemAndManually = ((UIScrollView *)newSuperview).realContentInset;
			[newSuperview addObserver:self forKeyPath:KafkaContentOffset options:options context:nil];
			[newSuperview addObserver:self forKeyPath:KafkaContentSize options:options context:nil];
			_observering = YES;
		}
	}
}

- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	if (self.shouldRefreshWhenDisplayed) {
		[self setScrollViewToRefreshLocation];
		self.shouldRefreshWhenDisplayed = NO;
	}
}

- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary<NSKeyValueChangeKey,id> *)change
					   context:(void *)context{
	if (!self.window) return;
	if ([keyPath isEqualToString:KafkaContentOffset]) {
		CGPoint point = [[change valueForKey:NSKeyValueChangeNewKey] CGPointValue];
		//If you quickly scroll scrollview in an instant, contentoffset changes are not continuous
		[self kafkaScrollViewContentOffsetDidChange:point];
	}
	else if([keyPath isEqualToString:KafkaContentSize]){
		[self layoutSubviews];
	}
}

- (void)kafkaScrollViewContentOffsetDidChange:(CGPoint)contentOffset{}
 
- (void)beginRefreshing{
	if (self.isRefresh) return;
	self.triggeredRefreshByUser = YES;
	if (!self.window) {
		self.shouldRefreshWhenDisplayed = YES;
	}else{
		[self setScrollViewToRefreshLocation];
	}
}

- (void)setScrollViewToRefreshLocation{
	if (self.isTriggeredRefreshByUser) self.refreshState = KafkaRefreshStateScrolling;
}

- (void)endRefreshing{
	if (!self.isRefresh) return;
	[self kafkaRefreshStateDidChange:KafkaRefreshStateWillEndRefresh];
	self.refreshState = KafkaRefreshStateScrolling;
	[self setScrollViewToOriginalLocation];
}

- (void)setScrollViewToOriginalLocation{}

#pragma mark -

#pragma mark - progress callback

- (void)kafkaRefreshStateDidChange:(KafkaRefreshState)state{}

- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max{}

@end
