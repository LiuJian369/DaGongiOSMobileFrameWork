//
//  FloatViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/7/18.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "FloatViewController.h"
#import "HomeViewController.h"
#import "LeftPanelViewController.h"
#import "RightPanelViewController.h"
#import "JASidePanelController.h"
#import "AppDelegate.h"
@interface FloatViewController ()

@end

@implementation FloatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    HomeViewController* home = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    LeftPanelViewController* left = [[LeftPanelViewController alloc] initWithNibName:@"LeftPanelViewController" bundle:nil];
    RightPanelViewController* right = [[RightPanelViewController alloc] initWithNibName:@"RightPanelViewController" bundle:nil];
    
    //侧滑栏
    JASidePanelController *panelVC = [[JASidePanelController alloc] init];
    
    panelVC.leftPanel = left;
    panelVC.rightPanel = right;
    panelVC.centerPanel = home;
    //    [_baseNav pushViewController:PaneVC animated:YES];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController =panelVC;
    
//    //导航
//    _nav = [[UINavigationController alloc] initWithRootViewController:panelVC];
//    [_nav setNavigationBarHidden:YES];
//    self.view.window.rootViewController = _nav;
//    [self.view.window makeKeyAndVisible];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
