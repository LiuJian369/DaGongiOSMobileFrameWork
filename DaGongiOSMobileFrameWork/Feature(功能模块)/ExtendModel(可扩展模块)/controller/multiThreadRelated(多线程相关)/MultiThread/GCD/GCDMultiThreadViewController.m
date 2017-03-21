//
//  GCDMultiThreadViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 DaGong. All rights reserved.
//

/****************
 NOTE:
 在GDC中一个操作是多线程执行还是单线程执行取决于当前队列类型和执行方法，只有队列类型为并行队列并且使用异步方法执行时才能在多个线程中执行。
 串行队列可以按顺序执行，并行队列的异步方法无法确定执行顺序。
 UI界面的更新最好采用同步方法，其他操作采用异步方法。
 
 
 其他任务执行方法
 
 GCD执行任务的方法并非只有简单的同步调用方法和异步调用方法，还有其他一些常用方法：
 dispatch_apply():重复执行某个任务，但是注意这个方法没有办法异步执行（为了不阻塞线程可以使用dispatch_async()包装一下再执行）。
 dispatch_once():单次执行一个任务，此方法中的任务只会执行一次，重复调用也没办法重复执行（单例模式中常用此方法）。
 dispatch_time()：延迟一定的时间后执行。
 dispatch_barrier_async()：使用此方法创建的任务首先会查看队列中有没有别的任务要执行，如果有，则会等待已有任务执行完毕再执行；同时在此方法后添加的任务必须等待此方法中任务执行后才能执行。（利用这个方法可以控制执行顺序，例如前面先加载最后一张图片的需求就可以先使用这个方法将最后一张图片加载的操作添加到队列，然后调用dispatch_async()添加其他图片加载任务）
 dispatch_group_async()：实现对任务分组管理，如果一组任务全部完成可以通过dispatch_group_notify()方法获得完成通知（需要定义dispatch_group_t作为分组标识）。
 ***************/

#import "GCDMultiThreadViewController.h"
#import "KCImageData.h"
#define ROW_COUNT 5
#define COLUMN_COUNT 3
#define ROW_HEIGHT 100
#define ROW_WIDTH ROW_HEIGHT
#define CELL_SPACING 10

@interface GCDMultiThreadViewController (){
    NSMutableArray *_imageViews;
    NSMutableArray *_imageNames;
}

@end

@implementation GCDMultiThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}

#pragma mark 界面布局
-(void)layoutUI{
    //创建多个图片控件用于显示图片
    _imageViews=[NSMutableArray array];
    for (int r=0; r<ROW_COUNT; r++) {
        for (int c=0; c<COLUMN_COUNT; c++) {
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(c*ROW_WIDTH+(c*CELL_SPACING), r*ROW_HEIGHT+(r*CELL_SPACING                           ), ROW_WIDTH, ROW_HEIGHT)];
            imageView.contentMode=UIViewContentModeScaleAspectFit;
            //            imageView.backgroundColor=[UIColor redColor];
            [self.view addSubview:imageView];
            [_imageViews addObject:imageView];
            
        }
    }
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 500, 220, 25);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //创建图片链接
    _imageNames=[NSMutableArray array];
    for (int i=0; i<ROW_COUNT*COLUMN_COUNT; i++) {
        [_imageNames addObject:[NSString stringWithFormat:@"http://images.cnblogs.com/cnblogs_com/kenshincui/613474/o_%i.jpg",i]];
    }
    
}

#pragma mark 将图片显示到界面
-(void)updateImageWithData:(NSData *)data andIndex:(int )index{
    UIImage *image=[UIImage imageWithData:data];
    UIImageView *imageView= _imageViews[index];
    imageView.image=image;
}

#pragma mark 请求图片数据
-(NSData *)requestData:(int )index{
    NSURL *url=[NSURL URLWithString:_imageNames[index]];
    NSData *data=[NSData dataWithContentsOfURL:url];
    
    return data;
}

#pragma mark 加载图片
-(void)loadImage:(NSNumber *)index{
    
    //如果在串行队列中会发现当前线程打印变化完全一样，因为他们在一个线程中
    NSLog(@"thread is :%@",[NSThread currentThread]);
    
    int i=(int)[index integerValue];
    //请求数据
    NSData *data= [self requestData:i];
    //更新UI界面,此处调用了GCD主线程队列的方法
    dispatch_queue_t mainQueue= dispatch_get_main_queue();
    dispatch_sync(mainQueue, ^{
        [self updateImageWithData:data andIndex:i];
    });
}

#pragma mark 多线程下载图片
//串行队列
-(void)loadImageWithMultiThread{
    int count=ROW_COUNT*COLUMN_COUNT;
    
    /*创建一个串行队列
     第一个参数：队列名称
     第二个参数：队列类型 串行队列
     */
    dispatch_queue_t serialQueue=dispatch_queue_create("myThreadQueue1", DISPATCH_QUEUE_SERIAL);//注意queue对象不是指针类型
    //创建多个线程用于填充图片
    for (int i=0; i<count; ++i) {
        //异步执行队列任务
        dispatch_async(serialQueue, ^{
            [self loadImage:[NSNumber numberWithInt:i]];
        });
        
    }
    //非ARC环境请释放
    //    dispatch_release(seriQueue);
}


/**********************
 并发队列
 并发队列同样是使用dispatch_queue_create()方法创建，只是最后一个参数指定为DISPATCH_QUEUE_CONCURRENT进行创建，但是在实际开发中我们通常不会重新创建一个并发队列而是使用dispatch_get_global_queue()方法取得一个全局的并发队列（当然如果有多个并发队列可以使用前者创建）。下面通过并行队列演示一下多个图片的加载。代码与上面串行队列加载类似，只需要修改照片加载方法如下：

-(void)loadImageWithMultiThread{
    int count=ROW_COUNT*COLUMN_COUNT;
    
     取得全局队列
     第一个参数：线程优先级
     第二个参数：标记参数，目前没有用，一般传入0
 
    dispatch_queue_t globalQueue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建多个线程用于填充图片
    for (int i=0; i<count; ++i) {
        //异步执行队列任务
        //改成同步执行dispatch_sync后，会造成主线程卡顿，图片会一次性显示出来
        dispatch_async(globalQueue, ^{
            [self loadImage:[NSNumber numberWithInt:i]];
        });
    }
}
 **********************/
@end
