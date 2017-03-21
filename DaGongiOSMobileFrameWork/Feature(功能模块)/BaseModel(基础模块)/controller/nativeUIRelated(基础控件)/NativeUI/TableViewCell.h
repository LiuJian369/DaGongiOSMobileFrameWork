//
//  TableViewCell.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iamge;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end
