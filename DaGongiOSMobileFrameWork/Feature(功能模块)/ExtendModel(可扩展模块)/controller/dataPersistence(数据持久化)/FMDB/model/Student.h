//
//  Student.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/24.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Student : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *sex;
@property (nonatomic, assign)NSInteger age;
@property (nonatomic, assign)CGFloat score;
@property (nonatomic, assign)NSInteger ID;
@end
