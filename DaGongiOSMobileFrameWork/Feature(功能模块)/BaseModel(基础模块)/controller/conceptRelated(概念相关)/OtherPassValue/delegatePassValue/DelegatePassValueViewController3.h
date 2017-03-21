//
//  DelegatePassValueViewController3.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol thirdViewDelegate
-(void)showName:(NSString *)nameString;
@end

@interface DelegatePassValueViewController3 : UIViewController
@property (nonatomic, weak)id<thirdViewDelegate> delegate;
@end
