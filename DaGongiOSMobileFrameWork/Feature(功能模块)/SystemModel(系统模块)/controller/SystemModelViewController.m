//
//  SystemModelViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/12.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "SystemModelViewController.h"
#import "GwbTableView.h"

@interface SystemModelViewController ()<GwbTableDataSourceDelegate>
@property (strong, nonatomic)  UITableView          *tableView;
@property (nonatomic, retain)  GwbTableDataSource   *dataSource;
@property (strong, nonatomic)  NSMutableArray       *dateForTableView;
@end



@implementation SystemModelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTable];
}


-(void) setUpTable
{
    self.dateForTableView= [NSMutableArray arrayWithObjects:@"清除缓存",nil];
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
//        [self.navigationController pushViewController:[[ViewControllerLifeCycle alloc] init] animated:YES];
    }
    
    
}
@end
