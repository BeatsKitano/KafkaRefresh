/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/

#import <UIKit/UIKit.h>
#import "KafkaRefreshStyle.h"
#import "KafkaRefreshControl.h"

/**
 Refresh the control's location
 */
typedef NS_ENUM(NSInteger,KafkaRefreshPosition) {
	KafkaRefreshPositionHeader = 0,
	KafkaRefreshPositionFooter
};

@interface UIScrollView (KafkaConfiguration)

/**
 This method can be directly bound to the UIScrolView refresh control
 
 @style control‘s style
 
 @fillColor fill color needed for animation
 
 @position Refresh the control's location
 
 @handler called when refreshing
 */
- (void)bindRefreshStyle:(KafkaRefreshStyle)style
			   fillColor:(UIColor *)fillColor
			  atPosition:(KafkaRefreshPosition)position
		   refreshHanler:(KafkaRefreshHandler)handler;

/**
  This method can be directly bound to the UIScrolView refresh control

 @param style control‘s style
 
 @param fillColor fill color needed for animation
 
 @param backgroundColor The background color of the layer that executes the animation
 
 @param position  Refresh the control's location
 
 @param handler called when refreshing
 */
- (void)bindRefreshStyle:(KafkaRefreshStyle)style
			   fillColor:(UIColor *)fillColor
 animatedBackgroundColor:(UIColor *)backgroundColor
			  atPosition:(KafkaRefreshPosition)position
		   refreshHanler:(KafkaRefreshHandler)handler;

/**
 If you set the global environment through KafkaRefreshDefaults,
 
 then call this method directly
 
 @position Refresh the control's location
 
 @handler called when refreshing
 */
- (void)bindDefaultRefreshStyleAtPosition:(KafkaRefreshPosition)position
							refreshHanler:(KafkaRefreshHandler)handler;

@end

