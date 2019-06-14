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
#import "KafkaCategories.h"

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
	self.promptlabel.center = CGPointMake(self.kr_width/2.0, self.kr_height/2.);
	
	self.arrowImgV.frame = CGRectMake(0, 0, 12, 12);
	self.arrowImgV.kr_right = self.promptlabel.kr_left-20.;
	self.arrowImgV.kr_top = self.promptlabel.kr_centerY;
	
	self.indicator.center = self.arrowImgV.center; 
}

- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max{
	
	
}

- (void)kafkaRefreshStateDidChange:(KafkaRefreshState)state{
	[super kafkaRefreshStateDidChange:state];
	__weak typeof(self) weakSelf = self;
	switch (state) {
		case KafkaRefreshStateNone:{
			self.arrowImgV.hidden = NO;
			[_indicator stopAnimating];
			[UIView animateWithDuration:0.3 animations:^{
				weakSelf.arrowImgV.transform = CGAffineTransformMakeRotation(M_PI);
			}];
			break;
		}
		case KafkaRefreshStateScrolling:{
			[_indicator stopAnimating];
			self.promptlabel.text = _pullingText;
			[self.promptlabel sizeToFit];
			__weak typeof(self) weakSelf = self;
			[UIView animateWithDuration:0.3 animations:^{
				weakSelf.arrowImgV.transform = CGAffineTransformMakeRotation(M_PI);
			}];
			break;
		}
		case KafkaRefreshStateReady:{
			[_indicator stopAnimating];
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
        NSBundle *b = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"Image" ofType:@"bundle"]];
        NSString *path = [b pathForResource:@"arrow48.png" ofType:nil];
		UIImage *image = [UIImage imageWithContentsOfFile:path];
		_arrowImgV = [[UIImageView alloc] initWithImage:image];
		_arrowImgV.layer.anchorPoint = CGPointMake(0.5, 0);
	}
	return _arrowImgV;
}

- (UILabel *)promptlabel{
	if (!_promptlabel) {
		_promptlabel = [UILabel new];
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
