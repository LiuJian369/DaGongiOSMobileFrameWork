//
//  DelegatePassValueViewController1.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegatePassValueViewController3.h"

@protocol toDelegateController2
-(void)toDelegateController2:(NSString *)value;//1.1定义协议与方法,用于正向传值
@end

@interface DelegatePassValueViewController1 : UIViewController<thirdViewDelegate>
@property (weak,nonatomic) id <toDelegateController2> delegate;
@end
