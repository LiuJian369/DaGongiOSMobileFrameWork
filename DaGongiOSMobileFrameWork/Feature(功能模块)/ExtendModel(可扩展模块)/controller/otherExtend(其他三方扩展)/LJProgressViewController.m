//
//  LJProgressViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by 刘建 on 16/11/3.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "LJProgressViewController.h"
#import "LXCircleAnimationView.h"
#import "UIView+Extensions.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface LJProgressViewController ()
@property (nonatomic, strong) LXCircleAnimationView *circleProgressView;
@end

@implementation LJProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.circleProgressView = [[LXCircleAnimationView alloc] initWithFrame:CGRectMake(40.f, 70.f, SCREEN_WIDTH - 80.f, SCREEN_WIDTH - 80.f)];
    self.circleProgressView.percent = 92.f;
    [self.view addSubview:self.circleProgressView];
    
    UIButton *stareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    stareButton.frame = CGRectMake(10.f, self.circleProgressView.bottom + 50.f, SCREEN_WIDTH - 20.f, 38.f);
    [stareButton addTarget:self action:@selector(onStareButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [stareButton setTitle:@"Stare Animation" forState:UIControlStateNormal];
    [stareButton setBackgroundColor:[UIColor lightGrayColor]];
    stareButton.layer.masksToBounds = YES;
    stareButton.layer.cornerRadius = 4.f;
    [self.view addSubview:stareButton];

}

- (void)onStareButtonClick {
    
    self.circleProgressView.percent = 90.f;
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
