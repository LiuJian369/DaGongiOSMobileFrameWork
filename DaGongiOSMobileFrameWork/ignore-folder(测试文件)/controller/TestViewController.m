//
//  TestViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "TestViewController.h"
#import "GwbButton.h"
#import "GwbTableView.h"
#import "CommonConfig.h"
#import "MJRefresh.h"

@interface TestViewController ()<GwbTableDataSourceDelegate>
@property (strong, nonatomic)  UITableView          *tableView;
@property (nonatomic, retain)  GwbTableDataSource   *dataSource;
@property (strong, nonatomic)  NSMutableArray       *dateForTableView;
@end


@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTable]; //table的使用方法
//  [self setUpButton]; //按钮的使用方法
    }

-(void) setUpButton{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(100, 100, 100, 100) title:@"test" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        [self setUpTable];}];
     btn.backgroundColor=[UIColor yellowColor];
     [self.view addSubview:btn];
       
}

-(void) setUpTable{
    self.dateForTableView= [[NSMutableArray alloc] init];
    [self.dateForTableView addObject:@"123"];
    CGRect gridCGRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = [[UITableView alloc]initWithFrame:gridCGRect];
    [self.view addSubview:self.tableView];
    GwbTableDataSource *dataSource = [[GwbTableDataSource alloc] initWithItems:self.dateForTableView cellIdentifier:@"testCell" cellType:kFYCellTypeDefault];
    dataSource.delegate = self;
    self.tableView.dataSource = dataSource;
    self.tableView.delegate = dataSource;
    self.dataSource = dataSource;
    //添加刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
}

//MJRefresh 具体操作
-(void) loadMoreData{
    //刷新的具体操作
    [self.dateForTableView addObject:@"321"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableView.mj_footer endRefreshing];
    });
}

//UITableview 选中方法
-(void) didSelectedCellWithItem:(id)item tableView:(UITableView *)tableView{
    NSLog(@"%@",@"123123");
}
@end
