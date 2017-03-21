//
//  HorizontalViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/17.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "HorizontalViewController.h"
#import "WSHorizontalPickerView.h"

@interface HorizontalViewController ()<WSHorizontalPickerViewDelegate>

@end

@implementation HorizontalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *itemNames = @[@"AA.jpg", @"BM.jpg", @"CM.jpg", @"DOOM.jpg", @"DP.jpg", @"DW.jpg", @"ES.jpg", @"FV.jpg", @"JUGG.jpg", @"Lich.jpg", @"Lina.jpg", @"LOA.jpg", @"Oracle.jpg", @"PA.jpg", @"POM.jpg", @"Puck.jpg", @"Pudge.jpg", @"QOP.jpg", @"SB.jpg", @"Silencer.jpg", @"SS.jpg", @"TA.jpg", @"VIP.jpg", @"WD.jpg"];
    
    NSArray *imageNames = [itemNames copy];
    
    WSHorizontalPickerView *WSHPickerView = [[WSHorizontalPickerView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 150)];
    WSHPickerView.itemTitles = itemNames;
    WSHPickerView.images = imageNames;
    WSHPickerView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [WSHPickerView updateData];
    [self.view addSubview:WSHPickerView];
}

- (void)selectItemAtIndex:(NSInteger)index
{
    NSLog(@"index is %ld", (long)index);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
