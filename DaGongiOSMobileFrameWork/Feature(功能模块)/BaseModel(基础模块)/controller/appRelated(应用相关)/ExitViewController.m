//
//  ExitViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "ExitViewController.h"
#import "GwbButton.h"
#import "CommonConfig.h"
#import "AppDelegate.h"

@implementation ExitViewController

-(void) viewDidLoad {
    
    [self setUpUI];
}

-(void) setUpUI{
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH/2-50, 100, 100, 100) title:@"退出应用" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        UIWindow *window = app.window;
        
        [UIView animateWithDuration:0.4f animations:^{
            window.alpha = 0;
            CGFloat y = window.bounds.size.height;
            CGFloat x = window.bounds.size.width / 2;
            window.frame = CGRectMake(x, y, 0, 0);
        } completion:^(BOOL finished) {
            exit(0);
        }];
    }];
    [self.view addSubview:btn];
}


- (void) animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    if ([animationID compare:@"exitApplication"] == 0)
    {
        exit(0);
    }
}
@end
