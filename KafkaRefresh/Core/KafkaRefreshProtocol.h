/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/

#ifndef KafkaRefreshProtocol_h
#define KafkaRefreshProtocol_h
#import <Foundation/Foundation.h>

/**
 - KafkaRefreshStateNone: Refresh control is not visible, and non-refresh state
 - KafkaRefreshStateScrolling: Refresh control visible, UIScrollView sliding
 - KafkaRefreshStateReady: release your hand to refresh
 - KafkaRefreshStateRefreshing: refreshing
 - KafkaRefreshStateWillEndRefresh: the end of the refresh will begin to slide to the original position
 */
typedef NS_ENUM(NSInteger,KafkaRefreshState) {
	KafkaRefreshStateNone			= 1,
	KafkaRefreshStateScrolling,
	KafkaRefreshStateReady,
	KafkaRefreshStateRefreshing,
	KafkaRefreshStateWillEndRefresh
};

@protocol KafkaRefreshControlProtocol<NSObject>

@end


@protocol KafkaRefreshProgressDelegate<NSObject>
@required

/**
 * when the state of the refresh control changes, the method is called
 *
 * @state KafkaRefreshState
 */
- (void)kafkaRefreshStateDidChange:(KafkaRefreshState)state;

/**
 * when the state of the refresh control changes, the method is called
 *
 * @progress  the current position offset of the control as a percentage of the offset that triggered the refresh
 *
 * @max the offset that triggered the refresh
 */
- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max;

@end

#endif /* KafkaRefreshProtocol_h */
