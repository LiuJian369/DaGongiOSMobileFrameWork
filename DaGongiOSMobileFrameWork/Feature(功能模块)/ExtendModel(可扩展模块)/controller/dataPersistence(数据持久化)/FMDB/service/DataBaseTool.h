//
//  DataBaseTool.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/24.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;
@interface DataBaseTool : NSObject
+ (instancetype)shareData;
- (BOOL)createTable;
- (BOOL)addStudent:(Student *)student;
- (BOOL)updateStudent:(Student *)student;
- (BOOL)deleteStudent:(Student *)student;
- (NSArray *)getStudent:(NSString *)search;


@end
