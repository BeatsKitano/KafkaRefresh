/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xorshine@icloud.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaCollectionViewController.h" 

#define MainColor  [UIColor colorWithRed:28./255. green:164./255. blue:252/255. alpha:1.]

@interface KafkaCollectionViewController ()
@property (assign, nonatomic) KafkaRefreshStyle style;
@end

@implementation KafkaCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)dealloc
{
	NSLog(@"KafkaCollectionViewController  dealloc");
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
								refreshStyle:(KafkaRefreshStyle)style{
	self = [super initWithCollectionViewLayout:layout];
	if (self) {
		_style = style;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = @"UICollectionView";
	 
	self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
	 
	__weak typeof(self) weakSelf = self;
	
	__block NSInteger count = 1;
    [self.collectionView bindHeadRefreshHandler:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (count > 0) {
                [weakSelf.collectionView.headRefreshControl endRefreshingWithAlertText:@"Did load successfully" completion:nil];
                count--;
            }else{
                [weakSelf.collectionView.headRefreshControl endRefreshingWithAlertText:@"使用中文测试" completion:nil];
            }
        });
    } themeColor:MainColor refreshStyle:_style];
	
    [self.collectionView bindFootRefreshHandler:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.collectionView.footRefreshControl endRefreshingAndNoLongerRefreshingWithAlertText:@"no more"];
        });
    } themeColor:MainColor refreshStyle:_style];
    
	self.collectionView.headRefreshControl.backgroundColor = [UIColor grayColor];
}
 
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
	NSInteger items = [collectionView numberOfItemsInSection:indexPath.section];
	cell.contentView.backgroundColor = [MainColor colorWithAlphaComponent:(items - indexPath.row *0.5)/items];
	
    return cell;
}

@end
