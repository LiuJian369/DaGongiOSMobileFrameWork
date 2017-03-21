//
//  ImgUpTitleDownButton.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "ImgUpTitleDownButton.h"

@implementation ImgUpTitleDownButton

+(id)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title image:(UIImage *)image handler:(tapHandler)handler{
    ImgUpTitleDownButton *button =[super buttonWithType:buttonType];
    button.frame=frame;
    button.titleLabel.textAlignment=NSTextAlignmentCenter;
    button.titleLabel.font=[UIFont systemFontOfSize:12];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.imageView.contentMode=UIViewContentModeCenter;
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    button.handler=handler;
    [button addTarget:button action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma --btnTapped

-(void)btnTapped:(UIButton *)sender{
    if(self.handler){
        self.handler(sender);
    }
}

#pragma --imageView frame

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageX=0;
    CGFloat imageY=0;
    CGFloat imageWidth =contentRect.size.width;
    CGFloat imageHeight=contentRect.size.height*(0.8);
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

#pragma --uilabel farme

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleX=0;
    CGFloat titleHeight=contentRect.size.height*0.2;
    CGFloat titleY=contentRect.size.height-titleHeight-3;
    CGFloat titleWidth=contentRect.size.width;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

@end
