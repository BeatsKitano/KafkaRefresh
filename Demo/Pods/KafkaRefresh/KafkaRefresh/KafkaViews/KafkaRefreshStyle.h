/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/



#ifndef KafkaRefreshStyle_h
#define KafkaRefreshStyle_h

typedef NS_ENUM(NSInteger,KafkaRefreshStyle) {
	//Native
	KafkaRefreshStyleNative  			= 0,
	
	//Replicator
	KafkaRefreshStyleReplicatorWoody,
	KafkaRefreshStyleReplicatorAllen,
	KafkaRefreshStyleReplicatorCircle,
	KafkaRefreshStyleReplicatorDot,
	KafkaRefreshStyleReplicatorArc,
	KafkaRefreshStyleReplicatorTriangle,
	
	//Ring
	KafkaRefreshStyleAnimatableRing, 
	KafkaRefreshStyleAnimatableArrow
};

#pragma mark - header styles

#import "KafkaNativeHeader.h"
#import "KafkaReplicatorHeader.h"
#import "KafkaRingIndicatorHeader.h"
#import "KafkaArrowHeader.h"

#pragma mark - footer styles

#import "KafkaNativeFooter.h"
#import "KafkaReplicatorFooter.h"
#import "KafkaRingIndicatorFooter.h"
#import "KafkaArrowFooter.h"

#endif /* KafkaRefreshStyle_h */
