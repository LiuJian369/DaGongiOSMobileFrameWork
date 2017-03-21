//
//  FMDBTableViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/24.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "FMDBTableViewController.h"
#import "DataBaseTool.h"
#import "Student.h"
#import "EditViewController.h"
#import "StuViewController.h"
static NSString *identifier = @"tableviewcell";
@interface FMDBTableViewController ()
@property (nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation FMDBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:(UIBarButtonItemStylePlain) target:self action:@selector(addAction:)];
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadData];
}
- (void)loadData
{
    NSArray *arr = [[DataBaseTool shareData] getStudent:nil];
    self.dataArray = arr.mutableCopy;
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addAction:(UIBarButtonItem *)sender
{
    EditViewController *newStuVC = [[EditViewController alloc] init];
    [self presentViewController:newStuVC animated:YES completion:nil];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    // Configure the cell...
    Student *stu = self.dataArray[indexPath.row];
    cell.textLabel.text = stu.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StuViewController *StuVC = [[StuViewController alloc] init];
    Student *stu = self.dataArray[indexPath.row];
    StuVC.student = stu;
    [self.navigationController pushViewController:StuVC animated:YES];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Student *student = self.dataArray[indexPath.row];
        [[DataBaseTool shareData] deleteStudent:student];
        [self loadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


@end
