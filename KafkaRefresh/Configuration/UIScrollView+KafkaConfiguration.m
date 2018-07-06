/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/

#import "UIScrollView+KafkaConfiguration.h"
#import "KafkaRefreshDefaults.h"
#import "UIScrollView+KafkaRefreshControl.h"
#import "KafkaNativeHeader.h"
#import "KafkaReplicatorHeader.h"
#import "KafkaRingIndicatorHeader.h"
#import "KafkaArrowHeader.h"
#import "KafkaNativeFooter.h"
#import "KafkaReplicatorFooter.h"
#import "KafkaRingIndicatorFooter.h"
#import "KafkaArrowFooter.h"

@implementation UIScrollView (KafkaConfiguration)

- (void)bindGlobalStyleForHeadRefreshHandler:(KafkaRefreshHandler)block{
    [self bindHeadRefreshHandler:block themeColor:[KafkaRefreshDefaults standardRefreshDefaults].themeColor refreshStyle:[KafkaRefreshDefaults standardRefreshDefaults].headDefaultStyle];
}

- (void)bindHeadRefreshHandler:(KafkaRefreshHandler)block themeColor:(UIColor *)color refreshStyle:(KafkaRefreshStyle)style {
    __kindof KafkaRefreshControl *head = nil;
    switch (style) {
        case KafkaRefreshStyleNative: {
            head = [[KafkaNativeHeader alloc] init];
            break;
        }
        case KafkaRefreshStyleReplicatorWoody:
        case KafkaRefreshStyleReplicatorAllen:
        case KafkaRefreshStyleReplicatorCircle:
        case KafkaRefreshStyleReplicatorDot:
        case KafkaRefreshStyleReplicatorArc:
        case KafkaRefreshStyleReplicatorTriangle:{
            head = [[KafkaReplicatorHeader alloc] init];
            ((KafkaReplicatorHeader *)head).animationStyle = style - 1;
            break;
        }
        case KafkaRefreshStyleAnimatableRing: {
            head = [[KafkaRingIndicatorHeader alloc] init];
            break;
        }
        case KafkaRefreshStyleAnimatableArrow: {
            head = [[KafkaArrowHeader alloc] init];
            break;
        }
    }
    head.refreshHandler = block;
    head.themeColor = color;
    self.headRefreshControl = head;
}

#pragma mark -

- (void)bindGlobalStyleForFootRefreshHandler:(KafkaRefreshHandler)block {
    [self bindFootRefreshHandler:block themeColor:[KafkaRefreshDefaults standardRefreshDefaults].themeColor refreshStyle:[KafkaRefreshDefaults standardRefreshDefaults].footDefaultStyle];
}

- (void)bindFootRefreshHandler:(KafkaRefreshHandler)block themeColor:(UIColor *)color refreshStyle:(KafkaRefreshStyle)style {
    __kindof KafkaFootRefreshControl *foot = nil;
    switch (style) {
        case KafkaRefreshStyleNative:{
            foot = [[KafkaNativeFooter alloc] init];
            break;
        }
        case KafkaRefreshStyleReplicatorWoody:
        case KafkaRefreshStyleReplicatorAllen:
        case KafkaRefreshStyleReplicatorCircle:
        case KafkaRefreshStyleReplicatorDot:
        case KafkaRefreshStyleReplicatorArc:
        case KafkaRefreshStyleReplicatorTriangle: {
            foot = [[KafkaReplicatorFooter alloc] init];
            ((KafkaReplicatorFooter *)foot).animationStyle = style - 1;
            break;
        }
        case KafkaRefreshStyleAnimatableRing: {
            foot = [[KafkaRingIndicatorFooter alloc] init];
            break;
        }
        case KafkaRefreshStyleAnimatableArrow: {
            foot = [[KafkaArrowFooter alloc] init];
            break;
        }
    }
    foot.themeColor = color;
    foot.refreshHandler = block;
    self.footRefreshControl = foot;
}

@end

#pragma mark -

@implementation UIScrollView(KafakaDeprecated)

- (void)bindRefreshStyle:(KafkaRefreshStyle)style fillColor:(UIColor *)fillColor atPosition:(KafkaRefreshPosition)position refreshHanler:(KafkaRefreshHandler)handler {
    __kindof KafkaRefreshControl *control = [self _classWithRefreshStyle:style color:fillColor position:position];
    if (!control) return;
    control.refreshHandler = handler;
    if (position == KafkaRefreshPositionHeader) {
        self.headRefreshControl = control;
    }else{
        self.footRefreshControl = control;
    }
}

- (void)bindRefreshStyle:(KafkaRefreshStyle)style fillColor:(UIColor *)fillColor animatedBackgroundColor:(UIColor *)backgroundColor atPosition:(KafkaRefreshPosition)position  refreshHanler:(KafkaRefreshHandler)handler {
    __kindof KafkaRefreshControl *control = [self _classWithRefreshStyle:style color:fillColor position:position];
    if (!control) return;
    control.refreshHandler = handler;
    control.animatedBackgroundColor = backgroundColor;
    if (position == KafkaRefreshPositionHeader) {
        self.headRefreshControl = control;
    }else{
        self.footRefreshControl = control;
    }
}

- (void)bindDefaultRefreshStyleAtPosition:(KafkaRefreshPosition)position refreshHanler:(KafkaRefreshHandler)handler {
    if (position == KafkaRefreshPositionHeader) {
        __kindof KafkaRefreshControl *control = [self _classWithRefreshStyle:[KafkaRefreshDefaults standardRefreshDefaults].headDefaultStyle
                                                                       color:[KafkaRefreshDefaults standardRefreshDefaults].themeColor
                                                                    position:position];
        self.headRefreshControl = control;
        control.refreshHandler = handler;
    }else{
        __kindof KafkaRefreshControl *control = [self _classWithRefreshStyle:[KafkaRefreshDefaults standardRefreshDefaults].footDefaultStyle
                                                                       color:[KafkaRefreshDefaults standardRefreshDefaults].themeColor
                                                                    position:position];
        self.footRefreshControl = control;
        control.refreshHandler = handler;
    }
}

- (__kindof KafkaRefreshControl *)_classWithRefreshStyle:(KafkaRefreshStyle)style
                                                   color:(UIColor *)color
                                                position:(KafkaRefreshPosition)position{
    KafkaRefreshControl *cls = nil;
    switch (style) {
        case KafkaRefreshStyleNative:{
            if (position == KafkaRefreshPositionHeader) {
                cls = [[KafkaNativeHeader alloc] init];
            }else{
                cls = [[KafkaNativeFooter alloc] init];
            }
            break;
        }
        case KafkaRefreshStyleReplicatorWoody:
        case KafkaRefreshStyleReplicatorAllen:
        case KafkaRefreshStyleReplicatorCircle:
        case KafkaRefreshStyleReplicatorDot:
        case KafkaRefreshStyleReplicatorArc:
        case KafkaRefreshStyleReplicatorTriangle:{
            if (position == KafkaRefreshPositionHeader) {
                cls = [[KafkaReplicatorHeader alloc] init];
            }else{
                cls = [[KafkaReplicatorFooter alloc] init];
            }
            ((KafkaReplicatorHeader *)cls).animationStyle = style - 1;
            break;
        }
        case KafkaRefreshStyleAnimatableRing:{
            if (position == KafkaRefreshPositionHeader) {
                cls = [[KafkaRingIndicatorHeader alloc] init];
            }else{
                cls = [[KafkaRingIndicatorFooter alloc] init];
            }
            break;
        }
        case KafkaRefreshStyleAnimatableArrow:{
            if (position == KafkaRefreshPositionHeader) {
                cls = [[KafkaArrowHeader alloc] init];
            }else{
                cls = [[KafkaArrowFooter alloc] init];
            }
            break;
        }
    }
    cls.themeColor = color;
    return cls;
}

@end

