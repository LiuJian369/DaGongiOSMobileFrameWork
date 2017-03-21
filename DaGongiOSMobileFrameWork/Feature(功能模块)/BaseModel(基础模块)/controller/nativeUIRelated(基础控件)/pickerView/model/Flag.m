//
//  Flag.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/26.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "Flag.h"

@implementation Flag

- (instancetype) initWithDictionary:(NSDictionary *)dictionary
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}


+ (instancetype) flagWithDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithDictionary:dictionary];
}

@end
