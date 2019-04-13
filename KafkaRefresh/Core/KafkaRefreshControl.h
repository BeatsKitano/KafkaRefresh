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

#ifndef Kafka_REQUIRES_SUPER
# if __has_attribute(objc_requires_super)
#  define Kafka_REQUIRES_SUPER __attribute__((objc_requires_super))
# else
#  define Kafka_REQUIRES_SUPER
# endif
#endif

#define KafkaColorWithRGBA(r,g,b,a)  \
[UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:(a)]

/**
 Refresh the control's location
 */
typedef NS_ENUM(NSInteger,KafkaRefreshPosition) {
    KafkaRefreshPositionHeader = 0,
    KafkaRefreshPositionFooter
};

typedef void(^KafkaRefreshHandler)(void); 

/**
 Refresh control base class, developers do not use this class directly
 */
NS_CLASS_AVAILABLE_IOS(7_0) @interface KafkaRefreshControl: UIView <KafkaRefreshProgressDelegate>

/**
 The UIScrollView to which the control is added, developers may not set
 */
@property (nonatomic, weak, readonly) __kindof UIScrollView *scrollView;

/**
 Whether it is refreshing
 */
@property (nonatomic, readonly, getter=isRefresh) BOOL refresh;

/**
 Judge whether the animation is executed when the refresh is over
 */
@property (assign, nonatomic, getter=isAnimating) BOOL animating;

/**
 Control refresh status, developers may not set
 */
@property (nonatomic) KafkaRefreshState refreshState;

/**
 When the system automatically or manually adjust contentInset,
 
 this value will be saved
 */
@property (assign, nonatomic) UIEdgeInsets presetContentInsets;

/**
 This value is set to TRUE if the beginRefresh method is called automatically
 
 developers may not set
 */
@property (assign, nonatomic, getter=isTriggeredRefreshByUser) BOOL triggeredRefreshByUser;

/**
 the current position offset of the control as a percentage
 
 of the offset that triggered the refresh
 */
@property (assign, nonatomic) CGFloat progress;

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
 fill colors for points, lines, and faces that appear in this control.
 */
@property (strong, nonatomic) UIColor *themeColor;

/**
 The background color of the layer that executes the animation
 */
@property (strong, nonatomic) UIColor *animatedBackgroundColor;

/**
 if called method "endRefreshingAndNoLongerRefreshingWithAlertText:" to end refresh,
 shouldNoLongerRefresh will set TRUE.
 */
@property (assign, nonatomic,readonly, getter=isShouldNoLongerRefresh) BOOL shouldNoLongerRefresh;
/**
 scrollview trigger refresh automatically that don't need to scroll to bottom.
 default is YES;
 
 ATTENTION:!!!
 
 if (no data) {
    [tableView.footRefreshControl endRefreshingAndNoLongerRefreshingWithAlertText:@"no more"];
 } else {
    [tableView.footRefreshControl endRefreshingWithAlertText:@"Did load successfully" completion:nil];
 }
 */
@property (nonatomic, assign) BOOL autoRefreshOnFoot;

/**
 Set the color of the prompt text after the refresh is completed.

 @param alertTextColor color
 */
- (void)setAlertTextColor:(UIColor *)alertTextColor;

/**
 Set the background color of the prompt text after the refresh is completed.

 @param alertBackgroundColor color
 */
- (void)setAlertBackgroundColor:(UIColor *)alertBackgroundColor;

/**
 Called right after initialization is completed
 */
- (void)setupProperties Kafka_REQUIRES_SUPER;

/**
 Subclasses override this method 
 */
- (void)privateContentOffsetOfScrollViewDidChange:(CGPoint)contentOffset Kafka_REQUIRES_SUPER;
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

/**
 When this method is called to end the refresh, there will be a 1.5 second
 animated display of "text". Please note that the length of text, please
 try to be brief, otherwise it will be cut off.
 
 @param text default is nil, and no animation.
 @param completion when text is hidden, this block will be called.
 */
- (void)endRefreshingWithAlertText:(NSString *)text completion:(dispatch_block_t)completion Kafka_REQUIRES_SUPER;

/**
 Using this method means you clearly understand that refreshing
 is meaningless and refreshing will be disabled.

 @param text If the user continues to drag, it will display the “text”, and will not trigger refresh.
 */
- (void)endRefreshingAndNoLongerRefreshingWithAlertText:(NSString *)text Kafka_REQUIRES_SUPER;

/**
 After you call ‘endRefreshingAndNoLongerRefreshingWithAlertText’,
 you need to resume refresh available
 */
- (void)resumeRefreshAvailable;

@end
