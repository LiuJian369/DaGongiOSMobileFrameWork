//
//  FlagView.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/26.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  Flag;
@interface FlagView : UIView

@property (nonatomic,strong) Flag *flag;
+(instancetype) flagViewWithPickerView:(UIPickerView *) pickerView;

+(CGFloat) flagViewHeight;

@end
