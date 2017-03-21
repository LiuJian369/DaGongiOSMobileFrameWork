//
//  UILabelViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "UILabelViewController.h"
#import "CommonConfig.h"

@implementation UILabelViewController

-(void) viewDidLoad{

    [self setUpUI];
}

- (void)setUpUI {
    
    //普通label
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(150.0,120.0,200.0,50.0)];
    label1.text =  @"labeltest";
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
    
    
    
    //演示了自动折行及自适应高度
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 50)];
    label.text = @"今天下午全市多云到阴有阵雨或雷雨，今天夜里到明天阴有阵雨，雨量可达大雨。 东北风5-6级阵风7级，逐渐增强到6-7级阵风8级。 今天最高气温:26左右， 明晨最低气温:22左右。 今晨最低气温:21。 今日紫外线等级:2级，照射强度弱，适当防护。 明日洗车指数:4级，天气有雨，不宜洗车。";
    //清空背景颜色
    label.backgroundColor = [UIColor clearColor];
    //设置字体颜色为白色
    label.textColor = [UIColor whiteColor];
    //设置label的背景色为黑色
    label.backgroundColor = [UIColor blackColor];
    //文字居中显示
    label.textAlignment = UITextAlignmentCenter;
    //自动折行设置
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    //自适应高度
    CGRect txtFrame = label.frame;
    label.frame = CGRectMake(10, 100, 300,
    txtFrame.size.height =[label.text boundingRectWithSize:
                                                    CGSizeMake(txtFrame.size.width, CGFLOAT_MAX)
                                                                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                                         attributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font,NSFontAttributeName, nil] context:nil].size.height);
    label.frame = CGRectMake(10, 100, 300, txtFrame.size.height);
    [self.view addSubview:label];
}

@end
