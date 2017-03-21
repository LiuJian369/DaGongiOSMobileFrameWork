//
//  LearnAutoLayoutViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/12.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "LearnAutoLayoutViewController.h"
#import "Custom.h"

@interface LearnAutoLayoutViewController ()


@end

@implementation LearnAutoLayoutViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* nibView = [[NSBundle mainBundle] loadNibNamed:@"Custom" owner:nil options:nil];
    Custom *testView = [nibView firstObject];
    [self.view addSubview:testView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
