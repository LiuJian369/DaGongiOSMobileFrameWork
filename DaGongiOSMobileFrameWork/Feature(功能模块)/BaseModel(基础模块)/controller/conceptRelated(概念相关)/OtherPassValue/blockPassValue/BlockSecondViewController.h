//
//  SecondViewController.h
//  Demo_反向传值
//
//  Created by LZXuan on 15-3-23.
//  Copyright (c) 2015年 LZXuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BlockType)(NSString *str);
@interface BlockSecondViewController : UIViewController
@property(nonatomic,copy)BlockType myBlock;//申明回调函数
@end



