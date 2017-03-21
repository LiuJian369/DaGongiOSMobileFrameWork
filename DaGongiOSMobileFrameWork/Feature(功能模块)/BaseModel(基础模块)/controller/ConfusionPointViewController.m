//
//  ConfusionPointViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/11/3.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "ConfusionPointViewController.h"
#import "UILabel+LXAdd.h"
#import "CommonConfig.h"

@interface ConfusionPointViewController (){
    UIScrollView * _mainScrollView;
}

@end

@implementation ConfusionPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"UIlabel分类自动返回高度";
    [self setUpScrollView];
}


- (void)setUpScrollView{
    _mainScrollView=[[UIScrollView alloc] init];
    _mainScrollView.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:_mainScrollView];
    [self setUpContent];
}
    
- (void) setUpContent{
    UILabel *lab=[[UILabel alloc] init];
    lab.text=@"一款简单的UILabel。支持修改字间距，行间距，设置关键字，下划线，自动计算宽高并返回";
    //lab.backgroundColor=[UIColor lightGrayColor];
    lab.numberOfLines=0;
    lab.font=[UIFont systemFontOfSize:15];
    lab.textAlignment=NSTextAlignmentCenter;
    
    lab.characterSpace=6;//字间距
    lab.lineSpace=5;//行间距
    //关键字
    lab.keywords=@"关键字";
    lab.keywordsColor=[UIColor redColor];
    lab.keywordsFont=[UIFont systemFontOfSize:20];
    //下划线
    lab.underlineStr=@"下划线";
    lab.underlineColor=[UIColor redColor];
    //计算label的宽高
    CGSize labSize =  [lab getLableSizeWithMaxWidth:300];
    lab.frame=CGRectMake(40, 100, labSize.width, labSize.height);
    [_mainScrollView addSubview:lab];

}
    
@end
