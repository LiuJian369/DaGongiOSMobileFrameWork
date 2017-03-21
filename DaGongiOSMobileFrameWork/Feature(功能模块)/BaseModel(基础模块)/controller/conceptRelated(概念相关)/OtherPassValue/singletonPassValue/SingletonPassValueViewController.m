//
//  SingletonPassValueViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "SingletonPassValueViewController.h"
#import "Datahandle.h"
#import "GwbButton.h"
#import "CommonConfig.h"
#import "SingletonPassValueViewController2.h"

@interface SingletonPassValueViewController()

@property (nonatomic,strong) UITextField *firstTF;
@end

@implementation SingletonPassValueViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    Datahandle *data = [Datahandle sharedHadle];
    //接收字符串并显示
    _firstTF.text = data.passVolud;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.firstTF = [[UITextField alloc]initWithFrame:CGRectMake(20, 300, 314, 50)];
    _firstTF.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_firstTF];
    self.navigationItem.title = @"第一页";
    
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(0, 400, SCREEN_WIDTH, 50) title:@"单例反向传值" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        [self.navigationController pushViewController:[[SingletonPassValueViewController2 alloc] init] animated:YES];
    }];
    btn.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn];
}



@end
