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

#define KafkaColorWithRGBA(r,g,b,a)  \
[UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:(a)]

typedef void(^KakfkaRefreshHandler)(void);

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
@property (copy, nonatomic) KakfkaRefreshHandler refreshHandler;

/**
 The threshold for trigger refresh default 1.0 must be set to not less than 1.0,
 
 developers can set the value
 */
@property (assign, nonatomic) CGFloat stretchOffsetYAxisThreshold;

/**
 fill color needed for animation
 */
@property (strong, nonatomic) UIColor * fillColor;

/**
 Called right after initialization is completed
 */
- (void)setupProperties;

/**
 Subclasses override this method 
 */
- (void)kafkaScrollViewContentOffsetDidChange:(CGPoint)contentOffset;
- (void)setScrollViewToRefreshLocation;
- (void)setScrollViewToOriginalLocation;

#pragma mark - public
/**
 Trigger refresh
 */
- (void)beginRefreshing;

/**
 end refresh
 */
- (void)endRefreshing;

@end
