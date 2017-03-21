//
//  SectionTableExampleViewController.m
//  Ratings
//
//  Created by gwb on 16/1/7.
//  Copyright (c) 2016年 gwb. All rights reserved.
//

#import "SectionTableExampleViewController.h"

@interface SectionTableExampleViewController()
@property(nonatomic,strong) NSArray *cityArray;
@property(nonatomic,strong) NSArray *provArray;
@end


@implementation SectionTableExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cityArray=@[@"abc",@"abc",@"abc",@"abc"];
    self.provArray=@[@"1",@"2"];
}


#pragma UItableView delegate method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.provArray count];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return  [self.cityArray count];
            break;
        case 1:
            return  [self.cityArray count];
            break;
        default:
            return 0;
            break;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"1";
            break;
        case 1:
            return @"2";
            break;
        default:
            return @"unknow";
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];}
    cell.textLabel.text=[self.cityArray objectAtIndex:indexPath.row];
    return cell;
}

@end
