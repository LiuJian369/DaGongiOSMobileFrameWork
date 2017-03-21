//
//  CommonConfig.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/5/24.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <Foundation/Foundation.h>
#define APPDELEGATE  ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define appdelegateWindow  [[UIApplication sharedApplication] delegate].window
#define NAVBLUECOLOR [UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define NAVHEIGHT 64
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6_6s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6plus_6splus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define FONT(F) [UIFont fontWithName:@"Menlo" size:F]
#define FONTBOLD(F) [UIFont fontWithName:@"Menlo-Bold" size:F]
#define ScreenRect                          [[UIScreen mainScreen] bounds]
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height

#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y

#define RectMaxX(f)                         CGRectGetMaxX(f)
#define RectMaxY(f)                         CGRectGetMaxY(f)
#define RectMinX(f)                         CGRectGetMinX(f)
#define RectMinY(f)                         CGRectGetMinY(f)


#define RectX(f)                            (f.origin.x)
#define RectY(f)                            (f.origin.y)
#define RectBottom(f)                       (f.origin.y + f.size.height)
#define RectTrailing(f)                     (f.origin.x + f.size.width)

#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectSetX(f, x)                      CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectSetY(f, y)                      CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectSetSize(f, w, h)                CGRectMake(RectX(f), RectY(f), w, h)
#define RectSetOrigin(f, x, y)              CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)



@interface CommonConfig : NSObject
@end
