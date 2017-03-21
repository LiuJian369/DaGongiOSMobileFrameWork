//
//  DelegatePassValueViewController3.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "DelegatePassValueViewController3.h"
#import "GwbButton.h"
#import "CommonConfig.h"

@interface DelegatePassValueViewController3 ()
@property (nonatomic,strong) UILabel *label;
@end

@implementation DelegatePassValueViewController3


-(void)viewDidLoad{
       _label = [self creatLabelWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 30) text:@"用于delegate逆向传值"];
        _label.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_label];
    
        GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(100, 300, 200, 50) title:@"delegate逆向传值" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
                [self.delegate showName:_label.text];
                [self.navigationController popViewControllerAnimated:YES];
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
