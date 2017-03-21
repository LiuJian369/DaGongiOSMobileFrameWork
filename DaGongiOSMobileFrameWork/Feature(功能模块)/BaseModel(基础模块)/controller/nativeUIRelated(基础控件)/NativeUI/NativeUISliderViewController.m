//
//  NativeUISliderViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "NativeUISliderViewController.h"
#import "Masonry.h"
#import "DaGongMacro.h"
#import "MMPlaceHolder.h"

@implementation NativeUISliderViewController

-(void)viewDidLoad{

    UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake(10 , 150, 300, 50)];
    //01.minimumValue  : 当值可以改变时，滑块可以滑动到最小位置的值，默认为0.0
    slider.minimumValue = 0.0;
    
    //02.maximumValue : 当值可以改变时，滑块可以滑动到最大位置的值，默认为1.0
    slider.maximumValue = 100.0;
    
    //03.当前值
    slider.value = 50;
    
    //04.continuous : 如果设置YES，在拖动滑块的任何时候，滑块的值都会改变。默认设置为YES
    [slider setContinuous:YES];
    
    //05.滑块条最小值处设置的图片，默认为nil
    slider.minimumValueImage = [UIImage imageNamed:@"appicon32.png"];
    
    //06.滑块条最大值处设置的图片，默认为nil
    slider.maximumValueImage = [UIImage imageNamed:@"appicon32.png"];
    
    //07.minimumTrackTintColor : 小于滑块当前值滑块条的颜色，默认为蓝色
    slider.minimumTrackTintColor = [UIColor redColor];
    
    //08.maximumTrackTintColor: 大于滑块当前值滑块条的颜色，默认为白色
    slider.maximumTrackTintColor = [UIColor blueColor];
    
    //09.thumbTintColor : 当前滑块的颜色，默认为白色
    slider.thumbTintColor = [UIColor yellowColor];
    
    //    10.currentMaximumTrackImage : 滑块条最大值处设置的图片
    //    11.currentMinimumTrackImage : 滑块条最小值处设置的图片
    //    12.currentThumbImage: 当前滑块的图片
    
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    WS(ws);
    [self.view addSubview:slider];
    // 使用mas_makeConstraints添加约束
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        // 添加大小约束（make就是要添加约束的控件view）
        make.size.mas_equalTo(CGSizeMake(200, 100));
        // 添加居中约束（居中方式与self相同）
        make.center.equalTo(ws.view);
    }];
    
   }

-(void)sliderValueChanged:(UISlider *)slider
{
    NSLog(@"slider value%f",slider.value);
}
@end
