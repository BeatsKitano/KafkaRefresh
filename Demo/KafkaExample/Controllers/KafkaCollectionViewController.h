/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xorshine@icloud.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import <UIKit/UIKit.h>
#import "KafkaRefresh.h"

@interface KafkaCollectionViewController : UICollectionViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
								refreshStyle:(KafkaRefreshStyle)style;

@end
