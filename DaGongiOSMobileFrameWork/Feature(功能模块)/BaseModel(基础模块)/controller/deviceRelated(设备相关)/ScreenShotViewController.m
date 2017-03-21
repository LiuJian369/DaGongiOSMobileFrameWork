//
//  ScreenShotViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "ScreenShotViewController.h"
#import "GwbButton.h"
#import "CommonConfig.h"

@interface ScreenShotViewController()

@property(strong,nonatomic) GwbButton *btn;

@end


@implementation ScreenShotViewController



-(void) viewDidAppear:(BOOL)animated
{
    [UIView animateWithDuration:2.0 animations:^{
        self.btn.alpha = 0.6;
    }];
}

-(void)viewDidLoad
{
    self.btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH/2-50, 100, 100, 100) title:@"截取当前屏幕" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        [self screenshot];
    }];
    [self.view addSubview:self.btn];
}

-(void) screenshot{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (!error) {
        NSLog(@"save success");
    }
}
@end
