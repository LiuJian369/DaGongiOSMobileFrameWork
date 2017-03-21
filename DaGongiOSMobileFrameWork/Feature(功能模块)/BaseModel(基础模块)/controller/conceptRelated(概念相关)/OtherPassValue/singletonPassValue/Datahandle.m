//
//  Datahandle.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "Datahandle.h"

@implementation Datahandle
static Datahandle *datahandle = nil;
//创建单例
+(instancetype)sharedHadle{
    if (nil == datahandle) {
        datahandle = [[Datahandle alloc]init];
    }
    return datahandle;
}
//也可以使用多线程创建
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//    datahandle = [[Datahandle alloc]init];
//    });
//
//   return datahandle;
@end