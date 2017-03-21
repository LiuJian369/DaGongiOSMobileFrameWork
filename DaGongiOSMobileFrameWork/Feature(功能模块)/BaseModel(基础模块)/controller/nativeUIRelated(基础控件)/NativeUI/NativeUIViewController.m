//
//  NativeUIViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "NativeUIViewController.h"
#import "GwbTableView.h"
#import "NativeUISliderViewController.h"
#import "NativeUICollectionViewController.h"
#import "NativeActionSheetController.h"
#import "NativeScrollViewController.h"
#import "NativeUITableViewController.h"

@interface NativeUIViewController ()<GwbTableDataSourceDelegate>
@property (strong, nonatomic)  UITableView          *tableView;
@property (nonatomic, retain)  GwbTableDataSource   *dataSource;
@property (strong, nonatomic)  NSMutableArray       *dateForTableView;
@end


@implementation NativeUIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self  setUpTable];
}


-(void) setUpTable{
    self.dateForTableView= [NSMutableArray arrayWithObjects:@"UISlider",@"UICollectionView",@"UIActionSheet",@"UIScrollView",@"自定义XIB-UITableView",nil];
    CGRect gridCGRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = [[UITableView alloc]initWithFrame:gridCGRect];
    [self.view addSubview:self.tableView];
    GwbTableDataSource *dataSource = [[GwbTableDataSource alloc] initWithItems:self.dateForTableView cellIdentifier:@"testCell" cellType:kFYCellTypeDefault];
    dataSource.delegate = self;
    self.tableView.dataSource = dataSource;
    self.tableView.delegate = dataSource;
    self.dataSource = dataSource;
}


-(void) didSelectedCellWithItem:(id)item tableView:(UITableView *)tableView
{
    if(self.tableView.indexPathForSelectedRow.row==0)
    {
        [self.navigationController pushViewController:[[NativeUISliderViewController alloc] init] animated:YES];
    }
    
    if(self.tableView.indexPathForSelectedRow.row==1)
    {
        [self.navigationController pushViewController:[[NativeUICollectionViewController alloc] init] animated:YES];
    }
    
    if(self.tableView.indexPathForSelectedRow.row==2)
    {
        [self.navigationController pushViewController:[[NativeActionSheetController alloc] init] animated:YES];
    }
    
    if(self.tableView.indexPathForSelectedRow.row==3)
    {
        [self.navigationController pushViewController:[[NativeScrollViewController alloc] init] animated:YES];
    }
    
    if(self.tableView.indexPathForSelectedRow.row==4)
    {
        [self.navigationController pushViewController:[[NativeUITableViewController alloc] init] animated:YES];
    }
}
@end

