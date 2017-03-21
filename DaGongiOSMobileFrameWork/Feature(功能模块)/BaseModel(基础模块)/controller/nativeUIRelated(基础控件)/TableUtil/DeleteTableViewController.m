//
//  DeleteTableViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "DeleteTableViewController.h"

@interface DeleteTableViewController ()
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation DeleteTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray= [[NSMutableArray alloc]initWithObjects:@"0",@"1",@"2",nil];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];}
        cell.textLabel.text=[self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
        return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除"handler:^(UITableViewRowAction *action,NSIndexPath *indexPath) {
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];

//设置收藏按钮
    UITableViewRowAction *collectRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"收藏"handler:^(UITableViewRowAction *action,NSIndexPath *indexPath) {
collectRowAction.backgroundColor = [UIColor greenColor];
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"收藏" message:@"收藏成功" delegate:self cancelButtonTitle:@"确定"otherButtonTitles:nil, nil];
        [alertView show];
}];
    
//设置置顶按钮
 UITableViewRowAction *topRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶"handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
     [self.dataArray  exchangeObjectAtIndex:indexPath.row withObjectAtIndex:0];
     NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
     [tableView moveRowAtIndexPath:indexPath toIndexPath:firstIndexPath];
     }];
    collectRowAction.backgroundEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    topRowAction.backgroundColor = [UIColor blueColor];
    collectRowAction.backgroundColor = [UIColor grayColor];
    return @[deleteRowAction,collectRowAction,topRowAction];
}

@end
