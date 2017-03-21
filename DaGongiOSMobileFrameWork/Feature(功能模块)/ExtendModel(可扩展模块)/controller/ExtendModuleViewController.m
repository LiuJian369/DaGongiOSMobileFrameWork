//
//  ExtendModuleViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/10/31.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "ExtendModuleViewController.h"

#define  ExtendModuleViewControllerTitle @"扩展模块"
@interface ExtendModuleViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView * _mainTableView;
    NSArray     * _titles;
    NSArray     * _detailTitles;
    NSArray     * _className;
}


@end

@implementation ExtendModuleViewController

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
    //主页面标签title
    _titles = @[@"图表相关",
                @"地图控件",
                @"数据持久化",
                @"多线程",
                @"布局",
                @"文字处理",
                @"web相关",
        //        @"即时通讯",
                @"其他扩展"
                ];
}

- (void)initDetalTitles
{
    //标签描述
    _detailTitles = @[@"三方图表，数据可视化",
                      @"高德地图",
                      @"应用中常见的数据持久化方式",
                      @"常见的多线程实现方式",
                      @"三方及原生布局方式",
                      @"文字处理及丰富色彩",
                      @"oc&js&html",
           //           @"环信",
                      @"另外一些三方库"
                      ];
}

- (void)initClassName
{
    //标签目标类
    _className = @[@"chartRelatedViewController",
                   @"mapRelatedViewController",
                   @"dataPersistenceViewController",
                   @"multiThreadRelatedViewController",
                   @"layoutRelatedViewController",
                   @"charactersHandleViewController",
                   @"webViewRelatedViewController",
            //       @"LoginRegisterViewController",
                   @"otherExtendViewController"
                   ];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = ExtendModuleViewControllerTitle;
    
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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setToolbarHidden:YES animated:animated];
}
@end
