//
//  NetWorkTableViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/5.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "NetWorkTableViewController.h"
#import "MJRefresh.h"
#import "SecondViewController.h"
#import "PresentationController.h"


@interface NetWorkTableViewController ()
@property (nonatomic,strong)NSArray *dataArray;
@end

@implementation NetWorkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray=@[@"mac",@"mac",@"mac",@"mac",@"mac"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
}

//MJRefresh 具体操作
-(void) loadMoreData{
    [self.tableView.mj_header endRefreshing];
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    secondVc.modalPresentationStyle = UIModalPresentationCustom;
    secondVc.preferredContentSize = secondVc.view.bounds.size;
    PresentationController *presentationController = [[PresentationController alloc] initWithPresentedViewController:secondVc presentingViewController:self];
    secondVc.transitioningDelegate = presentationController;
    [self presentViewController:secondVc animated:YES completion:nil];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];}
    cell.textLabel.text=[self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

@end
