/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * Email:xorshine@icloud.com
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaRefreshDefaults.h"

#define KafkaColorWithRGBA(r,g,b,a)  \
[UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:(a)]

@implementation KafkaRefreshDefaults

+ (instancetype)standardRefreshDefaults{
	static KafkaRefreshDefaults *defaults = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		defaults = [[KafkaRefreshDefaults alloc] init];
	});
	return defaults;
}

- (instancetype)init{
	if (self = [super init]) { 
		_headDefaultStyle = KafkaRefreshStyleAnimatableArrow;
		_footDefaultStyle = KafkaRefreshStyleNative;
		
		_themeColor = KafkaColorWithRGBA(28., 164., 252., 1.0);
		_backgroundColor = [UIColor whiteColor];
		
		_headPullingText = @"继续下拉";
		_footPullingText = @"继续上拉";
		_readyText = @"松开刷新";
		_refreshingText = @"正在加载";
	}
	return self;
}

@end
