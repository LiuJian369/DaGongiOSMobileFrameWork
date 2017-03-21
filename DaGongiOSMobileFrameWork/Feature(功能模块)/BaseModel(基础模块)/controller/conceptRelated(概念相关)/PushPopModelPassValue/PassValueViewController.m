//
//  PassValueViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "PassValueViewController.h"
#import "GwbButton.h"
#import "PassValueViewController2.h"
#import "CommonConfig.h"
#import "NSString+StringUtil.h"
#import "PassValueViewController4.h"

@implementation PassValueViewController

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%@",self.passValue1);
    if([NSString isBlankString:self.passValue1 ]){
        return;
    }else{
        [self setUpLabel];
    }
}

-(void) viewDidLoad{
    [self setUpUI];
}

-(void) setUpUI{
    [self.view setBackgroundColor:[UIColor whiteColor]];
        GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(100, 100, 100, 100) title:@"Push正向传值" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
            PassValueViewController2 *pa2=[[PassValueViewController2 alloc] init];
            pa2.firstValue=@"这是从第一个controller传过来的!";
            [self.navigationController pushViewController:pa2 animated:YES];
        }];
        btn.backgroundColor=[UIColor blueColor];
        [self.view addSubview:btn];
    
    GwbButton *btn2=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(100, 500, 150, 100) title:@"Modal正向传值" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        PassValueViewController4* vcm1 = [[PassValueViewController4 alloc] init];
        [vcm1 setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        vcm1.passValue4 = @"Modal传值"; // 传参
        [self.navigationController presentViewController:vcm1 animated:YES completion:nil];
    }];
    btn2.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn2];
}

-(void) setUpLabel{
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(100.0,250.0,200.0,50.0)];
    label1.text =  self.passValue1;
    //行数
    label1.numberOfLines=0;
    label1.backgroundColor=[UIColor redColor]; //可以去掉背景色
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
