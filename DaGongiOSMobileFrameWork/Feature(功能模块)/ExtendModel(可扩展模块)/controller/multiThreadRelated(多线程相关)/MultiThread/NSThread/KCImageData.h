//
//  KCImageData.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCImageData : NSObject

#pragma mark 索引

@property (nonatomic,assign) int index;

#pragma mark 图片数据

@property (nonatomic,strong) NSData *data;

@end