//
//  KafkaScrollViewController.h
//  KafkaExample
//
//  Created by 向小辉 on 2019/5/3.
//  Copyright © 2019 Kinx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KafkaRefresh.h"

NS_ASSUME_NONNULL_BEGIN

@interface KafkaScrollViewController : UIViewController
- (instancetype)initWithRefreshStyle:(KafkaRefreshStyle)style;
@end

NS_ASSUME_NONNULL_END
