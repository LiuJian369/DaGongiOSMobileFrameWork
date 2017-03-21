//
//  CheckNetWorkTableViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/6.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "CheckNetWorkTableViewController.h"
#import "RealReachability.h"
#import "MJRefresh.h"


@interface CheckNetWorkTableViewController ()
@property (nonatomic,strong)NSArray *dataArray;
@end

@implementation CheckNetWorkTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray=@[@"mac",@"mac",@"mac",@"mac",@"mac"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkChanged:)
                                                 name:kRealReachabilityChangedNotification
                                               object:nil];
    //网络监测
    ReachabilityStatus status = [GLobalRealReachability currentReachabilityStatus];
    NSLog(@"Initial reachability status:%@",@(status));
    
    if (status == RealStatusNotReachable)
    {
        NSLog(@"$$Network unreachable!");
    }
    
    if (status == RealStatusViaWiFi)
    {
         NSLog(@"$$Network wifi! Free!");
    }
    
    if (status == RealStatusViaWWAN)
    {
         NSLog(@"$$Network WWAN! In charge!");
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)testNetWork
{
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        switch (status)
        {
            case RealStatusNotReachable:
            {
                [[[UIAlertView alloc] initWithTitle:@"RealReachability" message:@"Nothing to do! offlineMode" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil] show];
                break;
            }
                
            case RealStatusViaWiFi:
            {
                [[[UIAlertView alloc] initWithTitle:@"RealReachability" message:@"Do what you want! free!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil] show];
                break;
            }
                
            case RealStatusViaWWAN:
            {
                [[[UIAlertView alloc] initWithTitle:@"RealReachability" message:@"Take care of your money! You are in charge!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil] show];
                
                WWANAccessType accessType = [GLobalRealReachability currentWWANtype];
                if (accessType == WWANType2G)
                {
                    NSLog(@"--RealReachabilityStatus2G");
                }
                else if (accessType == WWANType3G)
                {
                    NSLog(@"--RealReachabilityStatus3G");
                    
                }
                else if (accessType == WWANType4G)
                {
                     NSLog(@"--RealReachabilityStatus4G");
                    
                }
                else
                {
                     NSLog(@"--Unknown RealReachability WWAN Status, might be iOS6");
                    
                }
                
                break;
            }
                
            default:
                break;
        }
    }];
}

- (void)networkChanged:(NSNotification *)notification
{
    RealReachability *reachability = (RealReachability *)notification.object;
    ReachabilityStatus status = [reachability currentReachabilityStatus];
    ReachabilityStatus previousStatus = [reachability previousReachabilityStatus];
    NSLog(@"networkChanged, currentStatus:%@, previousStatus:%@", @(status), @(previousStatus));
    
    if (status == RealStatusNotReachable)
    {
        NSLog(@"**Network unreachable!");
    }
    
    if (status == RealStatusViaWiFi)
    {
         NSLog(@"**Network wifi! Free!");
    }
    
    if (status == RealStatusViaWWAN)
    {
         NSLog(@"**Network WWAN! In charge!");
    }
    
    WWANAccessType accessType = [GLobalRealReachability currentWWANtype];
    
    if (status == RealStatusViaWWAN)
    {
        if (accessType == WWANType2G)
        {
            NSLog(@"**RealReachabilityStatus2G");
        }
        else if (accessType == WWANType3G)
        {
            NSLog(@"**RealReachabilityStatus3G");
        }
        else if (accessType == WWANType4G)
        {
             NSLog(@"**RealReachabilityStatus4G");
        }
        else
        {
             NSLog(@"**Unknown RealReachability WWAN Status, might be iOS6");
        }
    }
}

//MJRefresh 具体操作
-(void) loadMoreData
{
    [self testNetWork];
     [self.tableView.mj_header endRefreshing];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];}
        cell.textLabel.text=[self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

@end