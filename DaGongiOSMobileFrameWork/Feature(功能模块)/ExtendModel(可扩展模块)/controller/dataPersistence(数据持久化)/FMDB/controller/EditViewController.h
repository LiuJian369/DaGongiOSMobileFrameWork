//
//  EditViewController.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/24.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student;
typedef void(^passStudent)(Student *student);
@interface EditViewController : UIViewController
@property (nonatomic, strong)Student *student;
@property (nonatomic ,copy)passStudent passStu;
@end

