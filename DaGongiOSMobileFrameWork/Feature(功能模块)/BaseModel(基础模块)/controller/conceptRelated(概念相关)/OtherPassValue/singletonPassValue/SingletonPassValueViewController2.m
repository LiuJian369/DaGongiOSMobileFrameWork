//
//  SingletonPassValueViewController2.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "SingletonPassValueViewController2.h"
#import "Datahandle.h"

@interface SingletonPassValueViewController2 ()
@property (nonatomic,strong) UITextField *secondTF;
@end


@implementation SingletonPassValueViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.secondTF = [[UITextField alloc]initWithFrame:CGRectMake(30, 300, 314, 50)];
    _secondTF.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_secondTF];
    self.navigationItem.title = @"第二页";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController popViewControllerAnimated:YES];
    Datahandle *data = [Datahandle sharedHadle];
    data.passVolud = _secondTF.text;
    NSLog(@"%@",data.passVolud);
}

@end
