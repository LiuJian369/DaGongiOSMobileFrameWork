//
//  STMovie.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/3.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STMovie : NSObject
@property (assign, nonatomic) int64_t  rowid;
@property (copy,   nonatomic) NSString *name;
@property (copy,   nonatomic) NSString *year;
@property (copy,   nonatomic) NSString *synopsis;
@property (copy,   nonatomic) NSString *thumbnailImageURLString;
@end
