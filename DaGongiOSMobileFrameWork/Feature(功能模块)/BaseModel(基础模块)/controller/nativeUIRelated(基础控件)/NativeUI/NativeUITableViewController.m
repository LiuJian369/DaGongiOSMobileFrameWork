//
//  NativeUITableViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/7/11.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "NativeUITableViewController.h"
#import "TableViewCell.h"

@interface NativeUITableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation NativeUITableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray = @[@"Mac Pro", @"Mac mini", @"iMac", @"MacBook", @"MacBook Pro", @"MacBook Air"]; //好的书写风格
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 420)];
    [table setDelegate:self];
    [table setDataSource:self];
    [self.view addSubview:table];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *simpleTableIdentifier = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];}
//    cell.textLabel.text=[self.dataArray objectAtIndex:indexPath.row];
//    以下是自定义xib
    static NSString *CellIdentifier = @"TableViewCell";
    //自定义cell类
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //通过xib的名称加载自定义的cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil] lastObject];
    }
    
    //添加测试数据
    cell.titleLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.content.text = @"这是一些测试数据";
    //测试图片
    cell.iamge.image = [UIImage imageNamed:@"home_normal@2x"];
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"click");
}
@end
