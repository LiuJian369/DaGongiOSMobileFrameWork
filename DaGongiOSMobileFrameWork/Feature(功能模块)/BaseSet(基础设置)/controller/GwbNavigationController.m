//
//  GwbNavigationController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/5/24.
//  Copyright © 2016年 DaGong. All rights reserved.
//

// gwb:抽取NavigationController做一些公用设置，比如统一设置返回，tabar的二级页隐藏等

#import "GwbNavigationController.h"
#import "CommonConfig.h"

@interface GwbNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation GwbNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    [self setupNavigationBar];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}


// gwb 全局导航栏样式的默认设置,可以在页面加载时更改
- (void)setupNavigationBar
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];//设置状态栏颜色
    UINavigationBar *appearance = [UINavigationBar appearance];
    //统一设置导航栏颜色，如果单个界面需要设置，可以在viewWillAppear里面设置，在viewWillDisappear设置回统一格式。
    [appearance setBarTintColor:NAVBLUECOLOR];
    NSMutableDictionary *textAttribute = [NSMutableDictionary dictionary];
    textAttribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:textAttribute];
}

// gwb 设置二级页隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
        [backButton setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        [backButton addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)popView
{
    [self popViewControllerAnimated:YES];
}

//手势代理
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}

@end
