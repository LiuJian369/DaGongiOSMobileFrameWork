//
//  BaseViewController.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/11/8.
//  Copyright © 2016年 DaGong. All rights reserved.
//


// gwb:这个controller是一个基类，用于抽取一些公用方法，可以选择继承或不继承


#import <UIKit/UIKit.h>
#import "UIImage+Color.h"
#import "Reachability.h"



// gwb:仿照UITableView
@protocol  BBBaseViewControllerDataSource<NSObject>

@optional
-(NSMutableAttributedString*)setTitle;
-(UIButton*)set_leftButton;
-(UIButton*)set_rightButton;
-(UIColor*)set_colorBackground;
-(CGFloat)set_navigationHeight;
-(UIView*)set_bottomView;
-(UIImage*)navBackgroundImage;
-(BOOL)hideNavigationBottomLine;
-(UIImage*)set_leftBarButtonItemWithImage;
-(UIImage*)set_rightBarButtonItemWithImage;
@end

@protocol BBBaseViewControllerDelegate <NSObject>

@optional
-(void)left_button_event:(UIButton*)sender;
-(void)right_button_event:(UIButton*)sender;
-(void)title_click_event:(UIView*)sender;
@end

@interface BaseViewController : UIViewController<BBBaseViewControllerDataSource , BBBaseViewControllerDelegate>
-(void)changeNavigationBarTranslationY:(CGFloat)translationY;
-(void)set_Title:(NSMutableAttributedString *)title;
@end
