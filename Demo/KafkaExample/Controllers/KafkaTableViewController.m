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
	self.tableView.rowHeight = 60.;
	self.tableView.sectionHeaderHeight = 35.;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	self.tableView.tableFooterView = [UIView new];
	self.tableView.backgroundColor = [UIColor whiteColor];
	
	__weak typeof(self) weakSelf = self;
	[self.tableView bindRefreshStyle:_style
						   fillColor:MainColor
						  atPosition:KafkaRefreshPositionHeader refreshHanler:^{
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			[weakSelf.tableView.headRefreshControl endRefreshing];
		});
	}];
	
	[self.tableView.headRefreshControl beginRefreshing];

	[self.tableView bindRefreshStyle:_style fillColor:MinorColor  atPosition:1 refreshHanler:^{
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			[weakSelf.tableView.footRefreshControl endRefreshing];
		});
	}];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { 
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
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
	label.text = @"——————————————————";
	return label;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0); 
	cell.contentView.backgroundColor = [MainColor colorWithAlphaComponent:0.7];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.textLabel.backgroundColor = [UIColor clearColor];
	cell.textLabel.textColor = MainColor;
	cell.textLabel.text = [NSString stringWithFormat:@"section: %ld  row: %ld",(long)indexPath.section,(long)indexPath.row];
}

@end
