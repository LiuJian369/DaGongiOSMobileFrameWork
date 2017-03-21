//
//  OtherPassValueController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "OtherPassValueController.h"
#import "GwbButton.h"
#import "GwbTableView.h"
#import "CommonConfig.h"
#import "MJRefresh.h"
#import "DelegatePassValueViewController1.h"
#import "BlockRootViewController.h"
#import "NotiPassValueViewController.h"
#import "SingletonPassValueViewController.h"


@interface OtherPassValueController ()<GwbTableDataSourceDelegate>
@property (strong, nonatomic)  UITableView          *tableView;
@property (nonatomic, retain)  GwbTableDataSource   *dataSource;
@property (strong, nonatomic)  NSMutableArray       *dateForTableView;
@end


@implementation OtherPassValueController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTable];
}

-(void) setUpTable{
    self.dateForTableView= [NSMutableArray arrayWithObjects:@"delegate传值",@"block逆向传值",@"Noti传值",@"单例传值",nil];
    CGRect gridCGRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = [[UITableView alloc]initWithFrame:gridCGRect];
    [self.view addSubview:self.tableView];
    GwbTableDataSource *dataSource = [[GwbTableDataSource alloc] initWithItems:self.dateForTableView cellIdentifier:@"testCell" cellType:kFYCellTypeDefault];
    dataSource.delegate = self;
    self.tableView.dataSource = dataSource;
    self.tableView.delegate = dataSource;
    self.dataSource = dataSource;
}


-(void) didSelectedCellWithItem:(id)item tableView:(UITableView *)tableView{
    if(self.tableView.indexPathForSelectedRow.row==0){
        [self.navigationController pushViewController:[[DelegatePassValueViewController1 alloc] init] animated:YES];
    }
    if(self.tableView.indexPathForSelectedRow.row==1){
        [self.navigationController pushViewController:[[BlockRootViewController alloc] init] animated:YES];
    }
    if(self.tableView.indexPathForSelectedRow.row==2){
        [self.navigationController pushViewController:[[NotiPassValueViewController alloc] init] animated:YES];
    }
    if(self.tableView.indexPathForSelectedRow.row==3){
        [self.navigationController pushViewController:[[SingletonPassValueViewController alloc] init] animated:YES];
    }
    
   
    
    
}


@end
