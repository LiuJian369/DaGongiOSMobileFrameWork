//
//  GCDMultiThreadViewController.h
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 DaGong. All rights reserved.
//

/*************************
 GCD(Grand Central Dispatch)是基于C语言开发的一套多线程开发机制，也是目前苹果官方推荐的多线程开发方法。前面也说过三种开发中GCD抽象层次最高，当然是用起来也最简单，只是它基于C语言开发，并不像NSOperation是面向对象的开发，而是完全面向过程的。对于熟悉C#异步调用的朋友对于GCD学习起来应该很快，因为它与C#中的异步调用基本是一样的。这种机制相比较于前面两种多线程开发方式最显著的优点就是它对于多核运算更加有效。
 GCD中也有一个类似于NSOperationQueue的队列，GCD统一管理整个队列中的任务。但是GCD中的队列分为并行队列和串行队列两类：
 串行队列：只有一个线程，加入到队列中的操作按添加顺序依次执行。
 并发队列：有多个线程，操作进来之后它会将这些队列安排在可用的处理器上，同时保证先进来的任务优先处理。
 其实在GCD中还有一个特殊队列就是主队列，用来执行主线程上的操作任务（从前面的演示中可以看到其实在NSOperation中也有一个主队列）。
 *************************/

#import <UIKit/UIKit.h>

@interface GCDMultiThreadViewController : UIViewController

@end
