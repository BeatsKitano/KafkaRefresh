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
#import "KafkaRefreshProtocol.h"
#import "UIView+KafkaLayout.h"
#import "NSObject+KafkaAnimation.h"
#import "UIScrollView+KafkaLayout.h"

#ifndef Kafka_REQUIRES_SUPER
# if __has_attribute(objc_requires_super)
#  define Kafka_REQUIRES_SUPER __attribute__((objc_requires_super))
# else
#  define Kafka_REQUIRES_SUPER
# endif
#endif

#define KafkaColorWithRGBA(r,g,b,a)  \
[UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:(a)]

typedef void(^KafkaRefreshHandler)(void);

/**
 Refresh control base class, developers do not use this class directly
 */
NS_CLASS_AVAILABLE_IOS(7_0) @interface KafkaRefreshControl : UIView<KafkaRefreshProgressDelegate>

/**
 The UIScrollView to which the control is added, developers may not set
 */
@property (nonatomic, weak, readonly) __kindof UIScrollView *scrollView;

/**
 Whether it is refreshing
 */
@property (nonatomic, readonly, getter=isRefresh) BOOL refresh;

/**
 Control refresh status, developers may not set
 */
@property (nonatomic) KafkaRefreshState refreshState;

/**
When the system automatically or manually adjust contentInset,
 
 this value will be saved
 */
@property (assign, nonatomic) UIEdgeInsets adjustInsetsBySystemAndManually;

/**
 This value is set to TRUE if the beginRefresh method is called automatically
 
 developers may not set
 */
@property (assign, nonatomic, getter = isTriggeredRefreshByUser) BOOL triggeredRefreshByUser;

/**
 the current position offset of the control as a percentage
 
 of the offset that triggered the refresh
 */
@property (assign, nonatomic) CGFloat progress;

/**
 The library's internal logic tag, when the control is drawn,
 
 whether it needs to be refreshed
 */
@property (assign, nonatomic) BOOL shouldRefreshWhenDisplayed;

/**
 Block will be called when refreshing
 */
@property (copy, nonatomic) KafkaRefreshHandler refreshHandler;

/**
 The threshold for trigger refresh default 1.0 must be set to not less than 1.0,
 
 default value is 1.3, developers can set the value
 */
@property (assign, nonatomic) CGFloat stretchOffsetYAxisThreshold;

/**
 fill color needed for animation
 */
@property (strong, nonatomic) UIColor * fillColor;

/**
 The background color of the layer that executes the animation
 */
@property (strong, nonatomic) UIColor * animatedBackgroundColor;

/**
 Judge whether the animation is executed when the refresh is over
 */
@property (assign, nonatomic, getter=isAnimating) BOOL animating;

/**
 Called right after initialization is completed
 */
- (void)setupProperties Kafka_REQUIRES_SUPER;

/**
 Subclasses override this method 
 */
- (void)kafkaScrollViewContentOffsetDidChange:(CGPoint)contentOffset;
- (void)setScrollViewToRefreshLocation Kafka_REQUIRES_SUPER;
- (void)setScrollViewToOriginalLocation Kafka_REQUIRES_SUPER;

#pragma mark - public
/**
 Trigger refresh
 */
- (void)beginRefreshing Kafka_REQUIRES_SUPER;

/**
 end refresh
 */
- (void)endRefreshing Kafka_REQUIRES_SUPER;

@end
