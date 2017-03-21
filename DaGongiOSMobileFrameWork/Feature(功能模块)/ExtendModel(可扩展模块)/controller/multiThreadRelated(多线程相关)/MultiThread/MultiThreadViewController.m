//
//  MultiThreadViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "MultiThreadViewController.h"
#import "GwbTableView.h"
#import "KCMainViewController.h"
#import "MultiKCMainViewController.h"
#import "MultiStopThreadViewController.h"
#import "GCDMultiThreadViewController.h"
#import "MultiNSOperationViewController.h"

@interface MultiThreadViewController ()<GwbTableDataSourceDelegate>
@property (strong, nonatomic)  UITableView          *tableView;
@property (nonatomic, retain)  GwbTableDataSource   *dataSource;
@property (strong, nonatomic)  NSMutableArray       *dateForTableView;
@end

@implementation MultiThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTable];
}

-(void) setUpTable{
    self.dateForTableView= [NSMutableArray arrayWithObjects:@"NSThread解决线程阻塞",@"NSThread多线程",@"NSThread可停多线程",@"NSOperation多线程",@"GCD",nil];
    CGRect gridCGRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = [[UITableView alloc]initWithFrame:gridCGRect];
    [self.view addSubview:self.tableView];
    GwbTableDataSource *dataSource = [[GwbTableDataSource alloc] initWithItems:self.dateForTableView cellIdentifier:@"testCell" cellType:kFYCellTypeDefault];
    dataSource.delegate = self;
    self.tableView.dataSource = dataSource;
    self.tableView.delegate = dataSource;
    self.dataSource = dataSource;
}


//UITableview 选中方法
-(void) didSelectedCellWithItem:(id)item tableView:(UITableView *)tableView{
    if(self.tableView.indexPathForSelectedRow.row==0){
        [self.navigationController pushViewController:[[KCMainViewController alloc] init] animated:YES];
    }
    
    if(self.tableView.indexPathForSelectedRow.row==1){
        [self.navigationController pushViewController:[[MultiKCMainViewController alloc] init] animated:YES];
    }
    
    if(self.tableView.indexPathForSelectedRow.row==2){
        [self.navigationController pushViewController:[[MultiStopThreadViewController alloc] init] animated:YES];
    }
    
    if(self.tableView.indexPathForSelectedRow.row==3){
        [self.navigationController pushViewController:[[MultiNSOperationViewController alloc] init] animated:YES];
    }
    
    if(self.tableView.indexPathForSelectedRow.row==4){
        [self.navigationController pushViewController:[[GCDMultiThreadViewController alloc] init] animated:YES];
    }
}
@end
