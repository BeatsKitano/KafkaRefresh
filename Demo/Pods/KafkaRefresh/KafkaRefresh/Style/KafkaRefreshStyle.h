/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/


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



