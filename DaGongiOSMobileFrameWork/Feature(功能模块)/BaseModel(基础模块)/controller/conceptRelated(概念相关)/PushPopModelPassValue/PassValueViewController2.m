//
//  PassValueViewController2.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "PassValueViewController2.h"
#import "CommonConfig.h"
#import "GwbButton.h"
#import "PassValueViewController.h"
#import "PassValueViewController3.h"
#import "PassValueViewController4.h"

@implementation PassValueViewController2

-(void) viewDidLoad{
    [self setUpUI];
    [self setUpButton];
}

-(void) setUpButton{
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(100, 100, 100, 100) title:@"pop返回传值" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        NSInteger preVCIndex = self.navigationController.viewControllers.count - 2;
        if (preVCIndex >= 0) {
            UIViewController *preVC = [self.navigationController.viewControllers objectAtIndex:preVCIndex];
            if ([preVC isKindOfClass:[PassValueViewController class]]) {
                PassValueViewController* vcn1 = (PassValueViewController*) preVC;
                vcn1.passValue1 = @"这是POP返回传值来自第二个controller"; // 传参
            }
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
    btn.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn];
    
    GwbButton *btn2=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(50, 500, 300, 50) title:@"push到第三个Controller" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        [self.navigationController pushViewController:[[PassValueViewController3 alloc] init] animated:YES];
    }];
    btn2.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn2];
}

-(void) setUpUI{
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(50.0,200.0,200.0,50.0)];
    label1.text =  self.firstValue;
    //行数
    label1.numberOfLines=0;
    label1.backgroundColor=[UIColor clearColor]; //可以去掉背景色
    //设置高亮
    label1.highlighted = YES;
    label1.highlightedTextColor = [UIColor orangeColor];
    //设置阴影
    label1.shadowColor  = [UIColor redColor];
    label1.shadowOffset = CGSizeMake(1.0,1.0);
    //设置是否能与用户进行交互
    label1.userInteractionEnabled = YES;
    //设置label中的文字是否可变，默认值是YES
    label1.enabled = NO;
    //设置文字过长时的显示格式
    label1.lineBreakMode = UILineBreakModeMiddleTruncation;//截去中间
    //设置字体
    label1.font = [UIFont fontWithName:@"Helvetica" size:16];
    //设置居中
    [label1 sizeToFit];
    label1.center = CGPointMake(SCREEN_WIDTH/2,SCREEN_HEIGHT/2);
    [self.view addSubview:label1];
}
@end
