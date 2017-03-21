//
//  RootViewController.m
//  Demo_反向传值
//
//  Created by LZXuan on 15-3-23.
//  Copyright (c) 2015年 LZXuan. All rights reserved.
//

#import "BlockRootViewController.h"
#import "BlockSecondViewController.h"
#import "GwbButton.h"
#import "CommonConfig.h"

@interface BlockRootViewController ()

@property(nonatomic,strong)   UILabel *label;

@end

@implementation BlockRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showUI];
}

- (void)showUI {
    //创建label
    _label = [self creatLabelWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 30) text:@"将显示从第二个controller传回来的值"];
    _label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_label];
    
    //登记回调函数
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(100, 300, 200, 50) title:@"showSecondWithBlock" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
            BlockSecondViewController *svc = [[BlockSecondViewController alloc] init];
            [svc setMyBlock:^(NSString *str) {
                _label.text = str;
            }];
            [self presentViewController:svc animated:YES completion:nil];
        }];
     btn.backgroundColor=[UIColor blueColor];
     [self.view addSubview:btn];
}


- (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:15];
    return label;
}


@end
