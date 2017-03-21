//
//  deviceRelatedViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/10/31.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "nativeUIRelatedViewController.h"

#define  nativeUIRelatedViewControllerTitle @"设备相关"
@interface nativeUIRelatedViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView * _mainTableView;
    NSArray     * _titles;
    NSArray     * _detailTitles;
    NSArray     * _className;
}


@end

@implementation nativeUIRelatedViewController

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
    _titles = @[@"xib自定义Cell",
                @"代码自定义Cell",
                @"UItableview标题头下拉放大",
                @"标准的tableView（动画效果）",
                @"UItableView（滑动出现按钮）",
                @"自定义XIB-UITableView",
                @"多个table切换",
                @"UIScrollView(横向滑动)",
                @"UIActionSheet（基本使用）",
                @"UICollectionView（基本使用）",
                @"UISlider（基本使用）",
                @"UILabel折行及高度适应",
                @"Button样式",
                @"图片横向滑动",
                @"日期选取1",
                @"日期选取2",
                @"下拉选择",
                @"pickerView",
                @"时间选择",
                @"sectionTable",
                @"UILabel扩展自动返回高度",
                @"UICollectionView（瀑布流效果）",
                @"AVFoundtion音视频播放",
                @"列表展开效果"
                ];
}



- (void)initClassName
{
    ///标签目标类
    _className = @[@"XibTableViewController",
                   @"XibTableViewController2",
                   @"ChangeHeaderTableViewController",
                   @"CommonUseTableViewController",
                   @"DeleteTableViewController",
                   @"NativeUITableViewController",
                   @"SegTableViewController",
                   @"NativeScrollViewController",
                   @"NativeActionSheetController",
                   @"NativeUICollectionViewController",
                   @"NativeUISliderViewController",
                   @"UILabelViewController",
                   @"UIButtonViewController",
                   @"HorizontalViewController",
                   @"DatePickerViewController",
                   @"DatePicker2ViewController",
                   @"DropDownTextFieldViewController",
                   @"PickerViewController",
                   @"MainViewController",
                   @"SectionTableExampleViewController",
                   @"ConfusionPointViewController",
                   @"CustomFlowViewController",
                   @"TestAVPlayViewController",
                   @"MPExpandHideViewController"
                   ];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = nativeUIRelatedViewControllerTitle;
    
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
