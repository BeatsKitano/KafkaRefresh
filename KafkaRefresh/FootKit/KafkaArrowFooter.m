/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xorshine@icloud.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaArrowFooter.h" 
#import "KafkaRefreshDefaults.h"

@interface KafkaArrowFooter()

@property (strong, nonatomic) UIImageView * arrowImgV;
@property (strong, nonatomic) UILabel * promptlabel;
@property (strong, nonatomic) UIActivityIndicatorView * indicator;

@end

@implementation KafkaArrowFooter

- (void)setupProperties{
	[super setupProperties];
	[self addSubview:self.arrowImgV];
	[self addSubview:self.promptlabel];
	[self addSubview:self.indicator];
	
	_pullingText = [KafkaRefreshDefaults standardRefreshDefaults].footPullingText;
	_readyText = [KafkaRefreshDefaults standardRefreshDefaults].readyText;
	_refreshingText = [KafkaRefreshDefaults standardRefreshDefaults].refreshingText;
}

- (void)layoutSubviews{
	[super layoutSubviews];
	
	[self.promptlabel sizeToFit];
	self.promptlabel.center = CGPointMake(self.width/2.0, self.height/2.);
	
	self.arrowImgV.frame = CGRectMake(0, 0, 12, 12);
	self.arrowImgV.right = self.promptlabel.left-20.;
	self.arrowImgV.top = self.promptlabel.centerY;
	
	self.indicator.center = self.arrowImgV.center;
}

- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max{
	__weak typeof(self) weakSelf = self;
	[UIView animateWithDuration:0.3 animations:^{
		weakSelf.arrowImgV.transform = CGAffineTransformMakeRotation(M_PI);
	}];
}

- (void)kafkaRefreshStateDidChange:(KafkaRefreshState)state{
	[super kafkaRefreshStateDidChange:state];
	__weak typeof(self) weakSelf = self;
	switch (state) {
		case KafkaRefreshStateNone:{
			self.arrowImgV.hidden = NO;
			[UIView animateWithDuration:0.3 animations:^{
				weakSelf.arrowImgV.transform = CGAffineTransformMakeRotation(M_PI);
			}];
			break;
		}
		case KafkaRefreshStateScrolling:{
			self.promptlabel.text = _pullingText;
			break;
		}
		case KafkaRefreshStateReady:{
			self.promptlabel.text = _readyText;
			[UIView animateWithDuration:0.3 animations:^{
				weakSelf.arrowImgV.transform = CGAffineTransformMakeRotation(M_PI*2);
			}];
			break;
		}
		case KafkaRefreshStateRefreshing:{
			self.promptlabel.text = _refreshingText;
			self.arrowImgV.hidden = YES;
			[_indicator startAnimating];
			break;
		}
		case KafkaRefreshStateWillEndRefresh:{ 
			[_indicator stopAnimating];
			break;
		}
	}
}

#pragma mark - getter

- (UIImageView *)arrowImgV{
	if (!_arrowImgV) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"Image" ofType:@"bundle"];
		NSString *urlString = [path stringByAppendingPathComponent:@"arrow48.png"];
		UIImage *image = [UIImage imageWithContentsOfFile:urlString];
		_arrowImgV = [[UIImageView alloc] initWithImage:image];
	}
	return _arrowImgV;
}

- (UILabel *)promptlabel{
	if (!_promptlabel) {
		_promptlabel = [[UILabel alloc] init];
		_promptlabel.textAlignment = NSTextAlignmentCenter;
		_promptlabel.textColor = KafkaColorWithRGBA(100.,100.,100.,1.0);
		if (@available(iOS 8.2, *))
			_promptlabel.font = [UIFont systemFontOfSize:11. weight:UIFontWeightThin];
		else
			_promptlabel.font = [UIFont systemFontOfSize:11.];
	}
	return _promptlabel;
}

- (UIActivityIndicatorView *)indicator{
	if (!_indicator) {
		_indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	}
	return _indicator;
}

@end
