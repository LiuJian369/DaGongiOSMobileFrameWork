//
//  PassValueViewController2.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PassValueViewController2 : UIViewController

//正向属性传值，首先确保被传值的controller里有相应的属性
@property(nonatomic,retain) NSString *firstValue ;
@end
