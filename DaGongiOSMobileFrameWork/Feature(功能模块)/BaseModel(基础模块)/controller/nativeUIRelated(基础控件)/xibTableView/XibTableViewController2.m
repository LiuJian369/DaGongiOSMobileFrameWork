//
//  XibTableViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/18.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "XibTableViewController2.h"
#import "MyCustomCell2.h"

@interface XibTableViewController2 ()
@property (strong, nonatomic) NSArray * items;
@end

@implementation XibTableViewController2

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
    self.tableView.rowHeight=101;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    MyCustomCell2 *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        //单元格样式设置为UITableViewCellStyleDefault
        cell = [[MyCustomCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(MyCustomCell2 *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell.hotelFX.image=[UIImage imageNamed:@"home_normal@2x"];
    cell.hotelIcon.image=[UIImage imageNamed:@"home_normal@2x"];
    cell.frText.text=@"法人:";
    cell.frContent.text=@"张三";
    cell.jynxText.text=@"经营年限:";
    cell.jynxContent.text=@"5年";
    cell.dzText.text=@"地址:";
    cell.dzContent.text=@"一环路成都市都江堰景路883号";
    cell.hotelNameText.text=@"中铁国际酒店";
}

@end
