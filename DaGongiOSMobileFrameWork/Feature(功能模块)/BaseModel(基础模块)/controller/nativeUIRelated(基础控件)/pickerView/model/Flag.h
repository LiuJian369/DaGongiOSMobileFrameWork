//
//  Flag.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/26.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject

@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *icon;

-(instancetype) initWithDictionary:(NSDictionary *) dictionary;
+(instancetype) flagWithDictionary:(NSDictionary *) dictionary;

@end
