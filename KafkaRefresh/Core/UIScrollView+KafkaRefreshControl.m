/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/

#import "UIScrollView+KafkaRefreshControl.h"
#import <objc/runtime.h>
#import "KafkaHeadRefreshControl.h"
#import "KafkaFootRefreshControl.h"

#define KafkaSelfSetValueRetainNonatomicAndKVOChange(keyPath,key,value) 			\
[self willChangeValueForKey:(keyPath)];												\
objc_setAssociatedObject(self,(key),(value),OBJC_ASSOCIATION_RETAIN_NONATOMIC);	\
[self addSubview:value]; 																\
[self didChangeValueForKey:(keyPath)];

const void * KafkaHeadRefreshKey = &KafkaHeadRefreshKey;
const void * KafkaFootRefreshKey = &KafkaFootRefreshKey;

NSString * KafkaHeadKeyPath = @"KafkaHeadKeyPath";
NSString * KafkaFootKeyPath = @"KafkaHeadKeyPath";

@implementation UIScrollView (KafkaRefreshControl)

#pragma mark - setter and getter

- (void)setHeadRefreshControl:(__kindof KafkaHeadRefreshControl *)headRefreshControl{
	if (headRefreshControl != self.headRefreshControl) {
		if (self.headRefreshControl) [self.headRefreshControl removeFromSuperview];
		KafkaSelfSetValueRetainNonatomicAndKVOChange(KafkaHeadKeyPath, KafkaHeadRefreshKey, headRefreshControl)
	}
}

- (KafkaHeadRefreshControl *)headRefreshControl{
	return objc_getAssociatedObject(self, KafkaHeadRefreshKey);
}

- (void)setFootRefreshControl:(__kindof KafkaFootRefreshControl *)footRefreshControl{
	if (footRefreshControl != self.footRefreshControl) {
		if (self.footRefreshControl) [self.footRefreshControl removeFromSuperview];
		KafkaSelfSetValueRetainNonatomicAndKVOChange(KafkaFootKeyPath, KafkaFootRefreshKey, footRefreshControl);
	}
}

- (KafkaFootRefreshControl *)footRefreshControl{
	return objc_getAssociatedObject(self, KafkaFootRefreshKey);
}

@end
