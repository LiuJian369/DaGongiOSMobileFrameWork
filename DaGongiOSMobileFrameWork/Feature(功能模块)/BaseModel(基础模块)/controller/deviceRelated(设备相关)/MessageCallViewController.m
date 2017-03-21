//
//  MessageCallViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "MessageCallViewController.h"
#import "GwbButton.h"
#import "CommonConfig.h"
#import <MessageUI/MessageUI.h>

@interface MessageCallViewController()<MFMessageComposeViewControllerDelegate>

@end

@implementation MessageCallViewController

-(void) viewDidLoad{
    [self setUpUI];
}

-(void) setUpUI{
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH/2-50, 100, 100, 100) title:@"发短信" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        if([MFMessageComposeViewController canSendText]){
            MFMessageComposeViewController *mc=[[MFMessageComposeViewController alloc] init];
            mc.messageComposeDelegate=self;
            mc.body=[[NSString alloc] initWithUTF8String:"nihao"];
            mc.recipients=[NSArray arrayWithObject:@"10010"];
            [self presentViewController:mc animated:NO completion:nil];
        }else{
            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Sms Error" message:@"device can not send sms text" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        
        
    }];
    [self.view addSubview:btn];
    
    GwbButton *btn2=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH/2-50, 300, 100, 100) title:@"打电话" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        NSString *num = [[NSString alloc] initWithFormat:@"tel://%@",@"13543478121"]; //number为号码字符串
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
        
        
    }];
    [self.view addSubview:btn2];
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result)
    {
        case MessageComposeResultSent:
            NSLog(@"text message sent successfully");
            break;
        case MessageComposeResultCancelled:
            NSLog(@"text message cancelled");
            break;
        case MessageComposeResultFailed:
            NSLog(@"text message failed");
            break;
        default:
            NSLog(@"error happens");
            break;
    }
}

@end
