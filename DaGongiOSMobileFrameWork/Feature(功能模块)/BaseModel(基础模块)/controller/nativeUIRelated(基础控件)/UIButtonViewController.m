//
//  UIButtonViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 DaGong. All rights reserved.
//

/* 
相关知识点  UIEdgeInsets UIEdgeInsetsMake (
CGFloat top,
CGFloat left,
CGFloat bottom,
CGFloat right
);
 */



#import "UIButtonViewController.h"
#import "CommonConfig.h"
#import "XBLoadingButton.h"

@implementation UIButtonViewController

-(void) viewDidLoad{
    [self setUpUI];
}


-(void)setUpUI {
    
    //按钮样式一  左边图标 右边标题的形式，偏移量根据需要自己设定
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, 100, 50);
    button.backgroundColor = [UIColor grayColor];
    //设置button正常状态下的图片
    [button setImage:[UIImage imageNamed:@"message_normal@2x.png"] forState:UIControlStateNormal];
    //设置button高亮状态下的图片
    [button setImage:[UIImage imageNamed:@"message_highlight@2x.png"] forState:UIControlStateHighlighted];
    [button setTitle:@"左图按钮" forState:UIControlStateNormal];
    //这样设置的情况下，图标和标题之间是没有缝隙的，如果要调整出空间则用这段button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);进行设置
    button.titleEdgeInsets = UIEdgeInsetsZero;
    button.imageEdgeInsets = UIEdgeInsetsZero;
    //设置button正常状态下的标题颜色
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置button高亮状态下的标题颜色
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    //控制标题大小
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:button];
    

    //按钮样式二  标题在图中，图片太小，如果要完全嵌入则要设置imageview填充大图或用大图片
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(10, 200, 100, 50);
    button2.backgroundColor = [UIColor grayColor];
    //设置button正常状态下的图片
    [button2 setImage:[UIImage imageNamed:@"message_normal@2x.png"] forState:UIControlStateNormal];
    //设置button高亮状态下的图片
    [button2 setImage:[UIImage imageNamed:@"message_highlight@2x.png"] forState:UIControlStateHighlighted];
    [button2 setTitle:@"标题在图中" forState:UIControlStateNormal];
    //设置button正常状态下的标题颜色
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置button高亮状态下的标题颜色
    [button2 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    //控制标题大小
    button2.titleLabel.font = [UIFont systemFontOfSize:16];
    
    button2.titleEdgeInsets = UIEdgeInsetsMake(0, -button2.imageView.frame.size.width, 0, 0);
    // button.imageEdgeInsets =         UIEdgeInsetsMake(0, 0, 0, -  button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    button2.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -button2.titleLabel.intrinsicContentSize.width);
    [self.view addSubview:button2];
    
   
    //按钮样式三  上图下标题
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(10, 300, 100, 50);
    button3.backgroundColor = [UIColor grayColor];
    //设置button正常状态下的图片
    [button3 setImage:[UIImage imageNamed:@"message_normal@2x.png"] forState:UIControlStateNormal];
    //设置button高亮状态下的图片
    [button3 setImage:[UIImage imageNamed:@"message_highlight@2x.png"] forState:UIControlStateHighlighted];
    [button3 setTitle:@"上图按钮" forState:UIControlStateNormal];
    //设置button正常状态下的标题颜色
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置button高亮状态下的标题颜色
    [button3 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    //控制标题大小
    button3.titleLabel.font = [UIFont systemFontOfSize:16];
    button3.titleEdgeInsets = UIEdgeInsetsMake(0, -button3.imageView.frame.size.width, -button3.imageView.frame.size.height, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    button3.imageEdgeInsets = UIEdgeInsetsMake(-button3.titleLabel.intrinsicContentSize.height, 0, 0, -button3.titleLabel.intrinsicContentSize.width);
    // ! 如果觉得图片和文字距离比较进可用下面的代码进行设置距离
//    CGFloat offset = 40.0f;
//    button3.titleEdgeInsets = UIEdgeInsetsMake(0, -button3.imageView.frame.size.width, -button3.imageView.frame.size.height-offset/2, 0);
//    button3.imageEdgeInsets = UIEdgeInsetsMake(-button3.titleLabel.intrinsicContentSize.height-offset/2, 0, 0, -button3.titleLabel.intrinsicContentSize.width);
    [self.view addSubview:button3];
    
    
    //按钮样式四  右图左标题
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(10, 400, 100, 50);
    button4.backgroundColor = [UIColor grayColor];
    //设置button正常状态下的图片
    [button4 setImage:[UIImage imageNamed:@"message_normal@2x.png"] forState:UIControlStateNormal];
    //设置button高亮状态下的图片
    [button4 setImage:[UIImage imageNamed:@"message_highlight@2x.png"] forState:UIControlStateHighlighted];
    [button4 setTitle:@"右图按钮" forState:UIControlStateNormal];
    //设置button正常状态下的标题颜色
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置button高亮状态下的标题颜色
    [button4 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    //控制标题大小
    button4.titleLabel.font = [UIFont systemFontOfSize:16];
    button4.titleEdgeInsets = UIEdgeInsetsMake(0, -button4.imageView.frame.size.width - button4.frame.size.width + button4.titleLabel.intrinsicContentSize.width, 0, 0);
    button4.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -button4.titleLabel.frame.size.width - button4.frame.size.width + button4.imageView.frame.size.width);
    [self.view addSubview:button4];
    
    
    //制作原型头像
    UIImageView *avatarImgView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 100, 75, 75)];
    avatarImgView.image = [UIImage imageNamed:@"demoicon.png"];
    // 图片做圆形，圆角角度为高度的一半，而高宽一致，因此可以形成正圆
    avatarImgView.layer.masksToBounds = YES;
    avatarImgView.layer.cornerRadius = avatarImgView.frame.size.height / 2 ;
    [self.view addSubview:avatarImgView];
    
   
    // 完全半圆圆角的按钮
    UIButton *btnOne = [[UIButton alloc] initWithFrame:CGRectMake(150, 250, 200, 40)];
    [btnOne setTitle:@"完全圆角" forState:UIControlStateNormal];
    [btnOne setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnOne setBackgroundColor:[UIColor colorWithRed:228.0/255.0 green:117.0/255.0 blue:97.0/255.0 alpha:1.0]];
    // 按钮圆弧，以高度的一半为圆角，两边会形成完整的半圆
    btnOne.layer.masksToBounds = YES;
    btnOne.layer.cornerRadius = btnOne.frame.size.height / 2;
    [self.view addSubview:btnOne];
    
    // 小圆角的按钮
    UIButton *btnTwo = [[UIButton alloc] initWithFrame:CGRectMake(150, 350, 200, 40)];
    [btnTwo setTitle:@"小圆角" forState:UIControlStateNormal];
    [btnTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnTwo setBackgroundColor:[UIColor colorWithRed:228.0/255.0 green:117.0/255.0 blue:97.0/255.0 alpha:1.0]];
    // 按钮圆弧，以高度的一半为圆角，两边会形成完整的半圆
    btnTwo.layer.masksToBounds = YES;
    btnTwo.layer.cornerRadius = 4.0;
    [self.view addSubview:btnTwo];
   
    
    // 带边框的圆角Label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(150, 450, 200, 40)];
    label.text = @"带边框圆角label";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:228.0/255.0 green:117.0/255.0 blue:97.0/255.0 alpha:1.0];
    // 设置边框宽度
    label.layer.borderWidth = 1.0;
    // 设置边框颜色
    label.layer.borderColor = [[UIColor colorWithRed:228.0/255.0 green:117.0/255.0 blue:97.0/255.0 alpha:1.0] CGColor];
    // 设置圆角
    [label.layer setCornerRadius:4.0];
    [self.view addSubview:label];
    
    
    XBLoadingButton* btn = [[XBLoadingButton alloc] initWithFrame:CGRectMake(100, 200, 80, 80)];
    [btn setTitle:@"点击开始"];
//    [btn setImage:@"demoicon"];
    
    __weak typeof (btn) wBtn = btn;
    [btn addAction:^{
        [wBtn setTitle:@"正在加载"];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(3);
            dispatch_async(dispatch_get_main_queue(), ^{
                [wBtn setTitle:@"点击开始"];
                [wBtn stop];
            });
        });
    }];
    [self.view addSubview:btn];
}

@end
