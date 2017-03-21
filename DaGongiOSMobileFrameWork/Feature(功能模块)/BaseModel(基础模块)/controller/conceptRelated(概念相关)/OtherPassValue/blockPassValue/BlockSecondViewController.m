//
//  SecondViewController.m
//  Demo_反向传值
//
//  Created by LZXuan on 15-3-23.
//  Copyright (c) 2015年 LZXuan. All rights reserved.
//

#import "BlockSecondViewController.h"
#import "GwbButton.h"
#import "CommonConfig.h"


@interface BlockSecondViewController ()

@property(nonatomic,strong)UITextField *textField;

@end

@implementation BlockSecondViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showUI];
}

- (void)showUI {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(100, 300, 200, 50) title:@"返回" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        //调用回调函数
        if (self.myBlock) {
            self.myBlock(_textField.text);
            [self dismissViewControllerAnimated:YES completion:nil];}
        else {
            NSLog(@"没有传入block");
        }
        }];
    btn.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn];
    _textField = [self creatTextFieldWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 30) placeHolder:nil delegate:nil tag:100];
    [self.view addSubview:_textField];
}


- (UITextField *)creatTextFieldWithFrame:(CGRect)frame placeHolder:(NSString *)string delegate:(id<UITextFieldDelegate>)delegate tag:(NSInteger)tag{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    //设置风格类型
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = string;
    //设置代理
    textField.delegate = delegate;
    //设置tag值
    textField.tag = tag;
    return textField;
}

@end
