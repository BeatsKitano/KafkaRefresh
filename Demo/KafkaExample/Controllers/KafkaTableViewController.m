/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xorshine@icloud.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaTableViewController.h"

#define MainColor  [UIColor colorWithRed:28./255. green:164./255. blue:252/255. alpha:1.]
#define MinorColor  [UIColor colorWithRed:180./255. green:144./255. blue:202/255. alpha:1.]

@interface KafkaTableViewController ()
@property (assign, nonatomic) KafkaRefreshStyle style;
@property (strong, nonatomic) NSMutableArray * source;
@end

@implementation KafkaTableViewController

- (void)dealloc
{
	NSLog(@"KafkaTableViewController  dealloc");
}

- (instancetype)initWithRefreshStyle:(KafkaRefreshStyle)style{
	self = [super init];
	if (self) {
		_style = style;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.title = @"UITableView";
	  
	self.navigationController.navigationBar.translucent = YES;
	[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
	
	self.tableView.estimatedRowHeight = 2.;
	self.tableView.sectionHeaderHeight = 35.;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	self.tableView.tableFooterView = [UIView new];
    
	UIBarButtonItem * refresh = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
	self.navigationItem.rightBarButtonItem = refresh;
	__block NSInteger count = 2;
	__weak typeof(self) weakSelf = self;
    
    KafkaRefreshHandler headBlock = ^(void){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (count > 0) {
                for (NSInteger i = 0; i < 3; i++) {
                    [weakSelf.source insertObject:@"" atIndex:0];
                }
                [weakSelf.tableView.headRefreshControl endRefreshingWithAlertText:@"Did load successfully" completion:nil];
                [weakSelf.tableView reloadData];
                count--;
            }else{
                [weakSelf.tableView.headRefreshControl endRefreshingWithAlertText:@"使用中文测试" completion:nil];
            }
        });
    };
    
    [self.tableView bindHeadRefreshHandler:headBlock themeColor:[UIColor redColor] refreshStyle:_style];
    
    KafkaRefreshHandler footBlock = ^(void){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.source addObjectsFromArray:@[@"",@"",@"",@"",@"",@""]];
            
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.footRefreshControl endRefreshingWithAlertText:@"Did load successfully" completion:^{
                [weakSelf.tableView reloadData];
            }];
        });
    };
    
    [self.tableView bindFootRefreshHandler:footBlock themeColor:MainColor refreshStyle:_style];
	[self.tableView.footRefreshControl setAlertTextColor:[UIColor redColor]];
    self.tableView.footRefreshControl.autoRefreshOnFoot = YES;
}

- (void)refresh{
	[self.tableView.headRefreshControl beginRefreshing]; 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (section == 0) {
		return self.source.count;
	}
	return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.row % 2 == 0) {
		return 40;
	}
	return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString * const reuseId = @"id";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
	}
	return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 35)];
	label.backgroundColor = MainColor;
	label.textAlignment = NSTextAlignmentCenter;
	label.textColor = [UIColor whiteColor]; 
	return label;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0); 
	cell.contentView.backgroundColor = [MainColor colorWithAlphaComponent:0.9];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.textLabel.backgroundColor = [UIColor clearColor];
	cell.textLabel.textColor = [UIColor whiteColor];
	cell.textLabel.text = [NSString stringWithFormat:@"section: %ld  row: %ld",(long)indexPath.section,(long)indexPath.row];
}

- (NSMutableArray *)source{
	if (!_source) {
		_source = @[@"",@"",@"",@"",@"",@"",@""].mutableCopy;
	}
	return _source;
}

@end
