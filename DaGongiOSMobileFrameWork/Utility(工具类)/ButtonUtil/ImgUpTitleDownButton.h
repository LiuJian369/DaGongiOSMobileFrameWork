//
//  ImgUpTitleDownButton.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^tapHandler)(UIButton *sender);

@interface ImgUpTitleDownButton : UIButton

@property (nonatomic,strong)tapHandler handler;

+(id)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title image:(UIImage *)image handler:(tapHandler) handler;
@end
