//
//  NativeActionSheetController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/7/1.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "NativeActionSheetController.h"
#import "GwbButton.h"

@interface NativeActionSheetController()<UIActionSheetDelegate>

@end

@implementation NativeActionSheetController

-(void) viewDidLoad{

    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(100, 100, 100, 100) title:@"test" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"测试" delegate:self cancelButtonTitle:@"cancle" destructiveButtonTitle:@"sure" otherButtonTitles:nil, nil];
        [sheet showInView:self.view];
    }];
    btn.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn];

}

//-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex

-(void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(buttonIndex == [actionSheet destructiveButtonIndex])
    {
        NSLog(@"cancle");
    }

}

@end
