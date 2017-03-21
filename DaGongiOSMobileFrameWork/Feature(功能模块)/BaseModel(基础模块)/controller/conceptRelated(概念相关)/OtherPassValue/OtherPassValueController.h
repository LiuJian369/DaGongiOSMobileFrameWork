//
//  OtherPassValueController.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 DaGong. All rights reserved.
//

/************************************************************
 NOTE:
 
 这个模块里总结了几种逆传值得方法，在开发中会经常用到，有如下几种，delegate传值，单例传值（之前用application的全局属性传值其实也是单例传值），block传值，通知传值，大致分为如下的使用场景：
 
 正向传值：正向传值通过属性即可满足，push和pop的正反向传值也比较简单。model的方式下正向也可以通过属性，但逆向较为复杂，推荐使用上面几种逆向传值的方法。当然上面几种方法也可以用于正向传值。
 
 逆向传值：方法大致为上面介绍的几种，使用下来个人感觉单例和通知较为方便，现在的使用场景还较少，更多内容后续添加。
 
 *************************************************************/





#import <UIKit/UIKit.h>

@interface OtherPassValueController : UIViewController

@end
