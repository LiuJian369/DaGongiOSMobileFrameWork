//
//  SXColorListPage.m
//  Wonderful
//
//  Created by dongshangxian on 15/10/30.
//  Copyright © 2015年 Sankuai. All rights reserved.
//

#import "SXColorListPage.h"
#import "SXColorListCell.h"
#import "UIColor+Wonderful.h"
#import "UIColor+Separate.h"
#import <objc/runtime.h>
#import "SXCLEntity.h"
#import "SXDataSource.h"
#import "CommonConfig.h"

@interface SXColorListPage ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)SXDataSource *dataSource;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation SXColorListPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [SXDataSource new];
    self.marray = self.dataSource.marray;
    self.titleArray = self.dataSource.titleArray;
    self.tableView =  [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 40;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.marray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SXCLEntity *cle = self.marray[indexPath.section][indexPath.row];
    NSLog(@"---%@",cle.methodName);
//    SXColorListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"colorCell"];
//    cell.NameLabel.text = cle.desc;
//    cell.NumLabel.text = cle.methodName;
//    cell.backgroundColor = SXRGB16Color(cle.colorValue);
    
      SXColorListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"colorCell"];
      [tableView registerNib:[UINib nibWithNibName:@"SXColorListCell" bundle:nil] forCellReuseIdentifier:@"colorCell"];
      cell = [tableView dequeueReusableCellWithIdentifier:@"colorCell"];
      cell.NameLabel.text = cle.desc;
      cell.NumLabel.text = cle.methodName;
      cell.backgroundColor = SXRGB16Color(cle.colorValue);
      return cell;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
    //    SXCLE *cle = self.marray[sourceIndexPath.section][sourceIndexPath.row];
    //    [self.marray removeObjectAtIndex:sourceIndexPath.row];
    //    [self.marray insertObject:cle atIndex:destinationIndexPath.row];
    
    NSMutableArray *temArray = [NSMutableArray array];
    [temArray addObjectsFromArray:self.marray[sourceIndexPath.section]];
    
    SXCLEntity *cle = temArray[sourceIndexPath.row];
    [temArray removeObjectAtIndex:sourceIndexPath.row];
    [temArray insertObject:cle atIndex:destinationIndexPath.row];
    
    self.marray[sourceIndexPath.section] = temArray;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.titleArray[section];
}



@end
