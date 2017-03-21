//
//  SGMeHeaderView.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/10.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "SGMeHeaderView.h"

@implementation SGMeHeaderView

+ (instancetype)createView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

@end
