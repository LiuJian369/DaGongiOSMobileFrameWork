//
//  MyCustomCell.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/18.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hotelImg;
@property (weak, nonatomic) IBOutlet UILabel *hotelName;
@property (weak, nonatomic) IBOutlet UILabel *hotelMan;
@property (weak, nonatomic) IBOutlet UILabel *hotelYear;
@property (weak, nonatomic) IBOutlet UILabel *hotelAddress;
@property (weak, nonatomic) IBOutlet UIImageView *hotelScore;

@end
