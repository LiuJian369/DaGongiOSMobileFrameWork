//
//  UIViewController+VCChat.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/5/26.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "UIViewController+VCChat.h"

@implementation UIViewController (VCChat)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"===%@===",NSStringFromClass([self class]));
}
#pragma clang diagnostic pop


@end
