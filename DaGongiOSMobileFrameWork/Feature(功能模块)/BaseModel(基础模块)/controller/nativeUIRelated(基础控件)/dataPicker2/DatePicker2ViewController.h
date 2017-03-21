//
//  DatePicker2ViewController.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/31.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMDatePicker.h"

@interface DatePicker2ViewController : UIViewController <UITextFieldDelegate,KMDatePickerDelegate>

@property (nonatomic, strong) UITextField *txtFCurrent;

@property (nonatomic, weak) IBOutlet UITextField *txtFYearMonthDayHourMinute;
@property (nonatomic, weak) IBOutlet UITextField *txtFMonthDayHourMinute;
@property (nonatomic, weak) IBOutlet UITextField *txtFYearMonthDay;
@property (nonatomic, weak) IBOutlet UITextField *txtFHourMinute;
@property (nonatomic, weak) IBOutlet UITextField *txtFLimitedDate;

@end
