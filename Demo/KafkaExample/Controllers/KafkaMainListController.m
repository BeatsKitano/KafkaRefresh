/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * e-mail:xorshine@icloud.com
 * github:https://github.com/xorshine
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaMainListController.h"
#import "KafkaTableViewController.h"
#import "KafkaCollectionViewController.h"
#import "KafkaCustomTableViewController.h" 
#import "KafkaRefresh.h"

#define MainColor  [UIColor colorWithRed:28./255. green:164./255. blue:252/255. alpha:1.]

@interface KafkaMainListController ()

@end

@implementation KafkaMainListController

- (void)dealloc{
	NSLog(@"call Dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
	 
	[self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
	[self.navigationController.navigationBar setTranslucent:NO];
	[self.navigationController.navigationBar setBarTintColor:MainColor];
	
	self.navigationItem.title = @"Kafka";
	self.tableView.rowHeight = 55.;
	self.tableView.sectionHeaderHeight = 35.;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	self.tableView.tableFooterView = [UIView new];
	
	__weak typeof(self) weakSelf = self;
	
	[self.tableView bindDefaultRefreshStyleAtPosition:KafkaRefreshPositionHeader refreshHanler:^{
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			[weakSelf.tableView.headRefreshControl endRefreshing];
		});
	}];
	[self.tableView bindDefaultRefreshStyleAtPosition:KafkaRefreshPositionFooter refreshHanler:^{
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			[weakSelf.tableView.footRefreshControl endRefreshing];
		});
	}];
	 
	[self.tableView.headRefreshControl beginRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self textArray].count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 35)];
	label.backgroundColor = [UIColor whiteColor];
	label.textAlignment = NSTextAlignmentCenter;
	label.textColor = MainColor;
	if (section == 0) {
		label.text = @"UITableView";
	}
	else if (section == 1){
		label.text = @"UICollectionView";
	}
	else if (section == 2){
		label.text = @"Custom";
	}
	
	return label;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString * const reuseId = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
	}
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
	NSInteger rows = [tableView numberOfRowsInSection:indexPath.section];
	cell.backgroundColor = [MainColor colorWithAlphaComponent:(rows - indexPath.row *0.5)/rows];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.detailTextLabel.textColor = [UIColor whiteColor];
	cell.textLabel.textColor = [UIColor whiteColor];
	NSInteger section = indexPath.section;
	if (section == 0) {
		cell.textLabel.text = @"UITableView";
	}
	else if (section == 1){
		cell.textLabel.text = @"UICollectionView";
	}
	else if (section == 2){
		cell.textLabel.text = @"Custom";
	}
	cell.detailTextLabel.text = [[self textArray] objectAtIndex:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.section == 0) {
		KafkaTableViewController * tableVC = [[KafkaTableViewController alloc] initWithRefreshStyle:indexPath.row];;
		[self.navigationController pushViewController:tableVC animated:YES];
	}
	else if (indexPath.section == 1){ 
		KafkaCollectionViewController *collectVC = [[KafkaCollectionViewController alloc] initWithCollectionViewLayout:[self flow] refreshStyle:indexPath.row];
		[self.navigationController pushViewController:collectVC animated:YES];
	}
	else if (indexPath.section == 2){
		KafkaCustomTableViewController *customVC = [[KafkaCustomTableViewController alloc] initWithRefreshStyle:indexPath.row];
		[self.navigationController pushViewController:customVC animated:YES];
	}
}

- (UICollectionViewFlowLayout *)flow{
	UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc] init];
	flow.minimumLineSpacing = 1.0;
	flow.minimumInteritemSpacing = 1.0;
	flow.itemSize = CGSizeMake((self.view.width - 3.)/4, (self.view.width - 3.)/4 * 1.3);
	flow.headerReferenceSize = CGSizeMake(self.view.width, 5.);
	return flow;
}

- (NSArray<NSString *> *)textArray{
	return @[
			 	@"KafkaRefreshStyleNative",
				@"KafkaRefreshStyleReplicatorWoody",
				@"KafkaRefreshStyleReplicatorAllen",
				@"KafkaRefreshStyleReplicatorCircle",
				@"KafkaRefreshStyleReplicatorDot",
				@"KafkaRefreshStyleReplicatorArc",
				@"KafkaRefreshStyleReplicatorTriangle",
				@"KafkaRefreshStyleAnimatableRing",
				@"KafkaRefreshStyleAnimatableArrow"
			 ];
}

@end
