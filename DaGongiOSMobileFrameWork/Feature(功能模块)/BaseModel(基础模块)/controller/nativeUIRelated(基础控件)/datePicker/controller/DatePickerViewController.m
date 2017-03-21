//
//  DatePickerViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/30.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "DatePickerViewController.h"
#import "HZQDatePickerView.h"

// 屏幕尺寸 ScreenRect
#define ScreenRect [UIScreen mainScreen].applicationFrame
#define ScreenRectHeight [UIScreen mainScreen].applicationFrame.size.height
#define ScreenRectWidth [UIScreen mainScreen].applicationFrame.size.width

@interface DatePickerViewController ()<HZQDatePickerViewDelegate> {
    
    HZQDatePickerView *_pikerView;
}

@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startDateClick:(id)sender {
    [self setupDateView:DateTypeOfStart];
}
- (IBAction)endDateClick:(id)sender {
     [self setupDateView:DateTypeOfEnd];
}


- (void)setupDateView:(DateType)type {
    
    _pikerView = [HZQDatePickerView instanceDatePickerView];
    _pikerView.frame = CGRectMake(0, 0, ScreenRectWidth, ScreenRectHeight + 20);
    [_pikerView setBackgroundColor:[UIColor clearColor]];
    _pikerView.delegate = self;
    _pikerView.type = type;
    // 今天开始往后的日期
    [_pikerView.datePickerView setMinimumDate:[NSDate date]];
    // 在今天之前的日期
    //    [_pikerView.datePickerView setMaximumDate:[NSDate date]];
    [self.view addSubview:_pikerView];
    
}

- (void)getSelectDate:(NSString *)date type:(DateType)type {
    NSLog(@"%d - %@", type, date);
    
    switch (type) {
        case DateTypeOfStart:
            _startLabel.text = [NSString stringWithFormat:@"开始日期:%@", date];
            
            break;
            
        case DateTypeOfEnd:
            _endLabel.text = [NSString stringWithFormat:@"结束日期:%@", date];
            
            break;
            
        default:
            break;
    }
}

@end
