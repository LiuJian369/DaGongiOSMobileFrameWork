//
//  XibTableViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/18.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "XibTableViewController.h"
#import "MyCustomCell.h"

@interface XibTableViewController ()
@property (strong, nonatomic) NSArray * items;
@end

@implementation XibTableViewController

- (NSArray *)items
{
    if (!_items)
    {
        NSMutableArray * arr = [NSMutableArray arrayWithCapacity:20];
        for (NSInteger i=0; i<20; i++)
            [arr addObject:[NSString stringWithFormat:@"Item%ld", (long)i]];
        _items = arr;
    }
    return _items;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight=90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCustomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"MyCustomCell" bundle:nil] forCellReuseIdentifier:@"myCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(MyCustomCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.hotelImg.image=[UIImage imageNamed:@"home_normal@2x"];
    cell.hotelMan.text=@"张三";
    cell.hotelName.text=@"中铁八局青城山庄";
    cell.hotelYear.text=@"5年";
    cell.hotelAddress.text=@"一环路成都市都江堰景路883号";
    cell.hotelScore.image=[UIImage imageNamed:@"home_normal@2x"];
}



@end
