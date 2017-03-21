//
//  MasonaryViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "MasonaryViewController.h"
#import "GwbTableView.h"
#import "MasonaryCase1ViewController.h"
#import "MasonaryCase2ViewController.h"
#import "TotalUpdateController.h"
#import "AspectFitController.h"
#import "BasicAnimatedController.h"
#import "ScrollViewController.h"
#import "ScrollViewComplexController.h"
#import "HeaderFooterViewController.h"
#import "TableViewController.h"

@interface MasonaryViewController ()<GwbTableDataSourceDelegate>
@property (strong, nonatomic)  UITableView          *tableView;
@property (retain, nonatomic)  GwbTableDataSource   *dataSource;
@property (strong, nonatomic)  NSMutableArray       *dateForTableView;
@end


@implementation MasonaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTable];
}


-(void) setUpTable{
    self.dateForTableView= [NSMutableArray arrayWithObjects:@"基本使用",@"重置约束",@"整体更新约束",@"约束百分比",@"基础动画",@"scrollView布局",@"复杂scrollView布局",@"header/footer 布局",@"tableview布局",nil];
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
        [self.navigationController pushViewController:[[MasonaryCase1ViewController alloc] init] animated:YES];
    }
    if(self.tableView.indexPathForSelectedRow.row==1){
        [self.navigationController pushViewController:[[MasonaryCase2ViewController alloc] init] animated:YES];
    }
    if(self.tableView.indexPathForSelectedRow.row==2){
        [self.navigationController pushViewController:[[TotalUpdateController alloc] init] animated:YES];
    }
    if(self.tableView.indexPathForSelectedRow.row==3){
        [self.navigationController pushViewController:[[AspectFitController alloc] init] animated:YES];
    }
    if(self.tableView.indexPathForSelectedRow.row==4){
        [self.navigationController pushViewController:[[BasicAnimatedController alloc] init] animated:YES];
    }
    if(self.tableView.indexPathForSelectedRow.row==5){
        [self.navigationController pushViewController:[[ScrollViewController alloc] init] animated:YES];
    }
    if(self.tableView.indexPathForSelectedRow.row==6){
        [self.navigationController pushViewController:[[ScrollViewComplexController alloc] init] animated:YES];
    }
    if(self.tableView.indexPathForSelectedRow.row==7){
        [self.navigationController pushViewController:[[HeaderFooterViewController alloc] init] animated:YES];
    }
    if(self.tableView.indexPathForSelectedRow.row==8){
        [self.navigationController pushViewController:[[TableViewController alloc] init] animated:YES];
    }
}
@end

