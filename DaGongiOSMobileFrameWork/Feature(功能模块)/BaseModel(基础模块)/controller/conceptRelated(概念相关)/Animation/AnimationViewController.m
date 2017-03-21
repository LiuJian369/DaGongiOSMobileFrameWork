//
//  AnimationViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/6.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "AnimationViewController.h"
#import "GwbButton.h"

@interface AnimationViewController ()
@property(strong,nonatomic) GwbButton *btn;
@end

@implementation AnimationViewController

-(void)viewDidAppear:(BOOL)animated
{
    self.btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(100, 100, 100, 100) title:@"动画效果1" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){}];
    [self.view addSubview:self.btn];
//    [UIView animateWithDuration:2.0 animations:^{}];  可以在代码中填入想要的动画效果
    [UIView animateWithDuration:1 delay:0.5 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^
    {
        CGRect temp = self.btn.frame;
        // 2. 给这个变量赋值。因为变量都是L-Value，可以被赋值
        temp.origin.x = 230;
        // 3. 修改frame的值
        self.view.frame = temp;
        //self.btn.alpha = 0.3;
    } completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

@end
