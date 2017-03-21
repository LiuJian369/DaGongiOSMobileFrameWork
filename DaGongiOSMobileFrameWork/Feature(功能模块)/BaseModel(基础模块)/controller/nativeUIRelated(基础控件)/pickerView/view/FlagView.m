//
//  FlagView.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/26.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "FlagView.h"
#import "Flag.h"

@interface FlagView ()
@property (weak, nonatomic) IBOutlet UILabel *contryLabel;

@property (weak, nonatomic) IBOutlet UIImageView *flagImage;

@end
@implementation FlagView

+ (instancetype) flagViewWithPickerView:(UIPickerView *)pickerView
{
    
    NSArray* nibView = [[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil];
    return [nibView firstObject];
//    return [[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil].lastObject;
}


-(void) setFlag:(Flag *)flag{
    _flag = flag;
    self.contryLabel.text=flag.name;
    self.flagImage.image=[UIImage imageNamed:flag.icon];
}

+ (CGFloat) flagViewHeight
{
    return 44;
}
@end
