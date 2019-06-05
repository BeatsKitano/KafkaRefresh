//
//  KafkaScrollViewController.m
//  KafkaExample
//
//  Created by 向小辉 on 2019/5/3.
//  Copyright © 2019 Kinx. All rights reserved.
//

#import "KafkaScrollViewController.h"


#define MainColor  [UIColor colorWithRed:28./255. green:164./255. blue:252/255. alpha:1.]
#define MinorColor  [UIColor colorWithRed:180./255. green:144./255. blue:202/255. alpha:1.]


@interface KafkaScrollViewController ()
@property (assign, nonatomic) KafkaRefreshStyle style;
@property(nonatomic, strong) UIScrollView *scrollView;
@end

@implementation KafkaScrollViewController

- (instancetype)initWithRefreshStyle:(KafkaRefreshStyle)style{
    self = [super init];
    if (self) {
        _style = style;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 11, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = false;
    } 
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:(UIBarMetricsDefault)];
    
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height*1.5);
    UIView *contentView = [UIView new];
    contentView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*1.5);
    contentView.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:contentView];
    
    KafkaRefreshHandler headBlock = ^(void){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.scrollView.headRefreshControl endRefreshing];
        });
    };
    
    [self.scrollView bindHeadRefreshHandler:headBlock themeColor:[UIColor redColor] refreshStyle:_style];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
    }
    return _scrollView;
}

@end
