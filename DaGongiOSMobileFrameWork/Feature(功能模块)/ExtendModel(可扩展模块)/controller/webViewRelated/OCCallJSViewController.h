//
//  OCCallJSViewController.h
//  DaGongiOSMobileFrameWork
//
//  Created by 刘建 on 16/11/15.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCCallJSViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)sendToJS:(id)sender;

@end
