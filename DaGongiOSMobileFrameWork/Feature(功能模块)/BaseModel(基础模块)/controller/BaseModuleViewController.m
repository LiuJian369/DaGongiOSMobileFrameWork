//
//  BaseModuleViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/10/31.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "BaseModuleViewController.h"
#define  BaseModuleViewControllerTitle @"基础模块"
@interface BaseModuleViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView * _mainTableView;
    NSArray     * _titles;
    NSArray     * _detailTitles;
    NSArray     * _className;
}


@end

@implementation BaseModuleViewController

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
    
    cell.detailTextLabel.text = _detailTitles[indexPath.section];
    
    return cell;
}


#pragma mark - init
- (void)initTitles
{
    ///主页面标签title
    _titles = @[@"设备相关",
                @"基础控件",
                @"应用相关",
                @"概念相关"
                ];
}

- (void)initDetalTitles
{
    ///标签描述
    _detailTitles = @[@"获取设备参数，调用手机基础功能",
                      @"基础原生控件的使用及扩展",
                      @"应用中常见的一些操作",
                      @"一些概念的测试和学习"
                      ];
}

- (void)initClassName
{
    ///标签目标类
    _className = @[@"deviceRelatedViewController",
                   @"nativeUIRelatedViewController",
                   @"appRelatedViewController",
                   @"conceptRelatedViewController"
                   ];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = BaseModuleViewControllerTitle;
    
    [self initTitles];
    [self initDetalTitles];
    [self initClassName];
    
    _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _mainTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _mainTableView.sectionHeaderHeight = 10;
    _mainTableView.sectionFooterHeight = 0;
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    
    [self.view addSubview:_mainTableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = NO;
    
    [self.navigationController setToolbarHidden:YES animated:animated];
}

@end
