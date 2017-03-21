//
//  ChangeHeaderTableViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/10.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "ChangeHeaderTableViewController.h"
#import "SGMeHeaderView.h"
#import "CommonConfig.h"


@interface ChangeHeaderTableViewController ()
@property (nonatomic,strong) UIView *headerViews;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UIImageView *headImageView;
@end

@implementation ChangeHeaderTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray=@[@"mac",@"mac",@"mac",@"mac",@"mac"];
    [self setLayoutHeaderView];
    
}


- (void)setLayoutHeaderView
{
//    用storyboard制作headerview下拉无变化，原因不明
//    self.headerViews = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 348)];
//    self.headerView = [SGMeHeaderView createView];
//    self.headerView.frame = self.headerViews.frame;
//    [self.headerViews addSubview:self.headerView];
//    self.tableView.tableHeaderView = self.headerViews;
 
//  直接用imageview做headerview
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    
    self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    
    self.headImageView.image = [UIImage imageNamed:@"h1.jpg"];
    [headView addSubview:self.headImageView];
    self.tableView.tableHeaderView = headView;
    
}



#pragma mark - Table view delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];}
        cell.textLabel.text=[self.dataArray objectAtIndex:indexPath.row];
        return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat yOffset = scrollView.contentOffset.y  ;
    
    if (yOffset < 0) {
        CGFloat totalOffset = 200 + ABS(yOffset);
        CGFloat f = totalOffset / 200;
        
        _headImageView.frame = CGRectMake(- (width * f - width) / 2, yOffset, width * f, totalOffset);
    }


}

@end
