//
//  appRelatedViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/10/31.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "appRelatedViewController.h"

#define appRelatedViewControllerTitle @"应用相关"
@interface appRelatedViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView * _mainTableView;
    NSArray     * _titles;
    NSArray     * _detailTitles;
    NSArray     * _className;
}


@end

@implementation appRelatedViewController

#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = _className[indexPath.section];
    
    UIViewController *subViewController = [[NSClassFromString(className) alloc] init];
    subViewController.title = _titles[indexPath.section];
    
    [self.navigationController pushViewController:subViewController animated:YES];
}

#pragma mark - tableView DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_titles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mainCellIdentifier = @"com.dagong.mainCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mainCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
        cell.detailTextLabel.numberOfLines = 0;
    }
    
    cell.textLabel.text = _titles[indexPath.section];
    
    return cell;
}


#pragma mark - init
- (void)initTitles
{
    ///主页面标签title
    _titles = @[@"登出",
                @"退出",
                @"图片上传",
                @"空白页"
                ];
}


- (void)initClassName
{
    ///标签目标类
    _className = @[@"LogOutViewController",
                   @"ExitViewController",
                   @"AccessPhotoViewController",
                   @"MPBlankPageViewController"
                   ];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = appRelatedViewControllerTitle;
    
    [self initTitles];
    [self initClassName];
    
    _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _mainTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _mainTableView.sectionHeaderHeight = 10;
    _mainTableView.sectionFooterHeight = 0;
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    
    [self.view addSubview:_mainTableView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = NO;
    
    [self.navigationController setToolbarHidden:YES animated:animated];
}

@end
