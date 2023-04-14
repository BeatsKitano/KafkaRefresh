/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/

#import "KafkaNativeHeader.h" 
#import "KafkaCategories.h"

@interface KafkaNativeHeader()


@end

@implementation KafkaNativeHeader 
 
- (void)setupProperties{
	[super setupProperties];
	[self addSubview:self.indicator];
}

- (void)layoutSubviews{
	[super layoutSubviews];
	 
	self.indicator.center = CGPointMake(self.kr_width/2., self.kr_height/2.); 
}

- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max{
	
}

- (void)kafkaRefreshStateDidChange:(KafkaRefreshState)state{
	[super kafkaRefreshStateDidChange:state];
	switch (state) {
		case KafkaRefreshStateNone:
		case KafkaRefreshStateScrolling:
		case KafkaRefreshStateReady:
			break;
		case KafkaRefreshStateRefreshing:{
			[self.indicator startAnimating];
			break;
		}
		case KafkaRefreshStateWillEndRefresh:{
		[self.indicator stopAnimating];
			break;
		}
	}
}

#pragma mark - getter

- (UIActivityIndicatorView *)indicator{
	if (!_indicator) {
        if (@available(iOS 13.0, *)) {
            _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
        } else {
            _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        } 
		
		_indicator.hidesWhenStopped = NO; 
	}
	return _indicator;
}

@end
