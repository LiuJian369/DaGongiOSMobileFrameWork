//
//  GwbButton.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "GwbButton.h"
#import "CommonConfig.h"

@implementation GwbButton

+(id)buttonWithRoundType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title image:(UIImage *)image handler:(tapHandler)handler{
    GwbButton *button =[super buttonWithType:buttonType];
    button.frame=frame;
    button.titleLabel.textAlignment=NSTextAlignmentCenter;
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.imageView.contentMode=UIViewContentModeCenter;
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    button.layer.cornerRadius=5;
    button.handler=handler;
    [button addTarget:button action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor=NAVBLUECOLOR;
    return button;
}


#pragma --btnTapped
-(void)btnTapped:(UIButton *)sender{
    if(self.handler){
        self.handler(sender);
    }
}
@end
