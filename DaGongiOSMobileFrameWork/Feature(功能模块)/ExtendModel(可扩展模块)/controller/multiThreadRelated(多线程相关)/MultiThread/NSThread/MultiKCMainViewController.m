//
//  MultiKCMainViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "MultiKCMainViewController.h"
#import "KCImageData.h"
#define ROW_COUNT 5
#define COLUMN_COUNT 3
#define ROW_HEIGHT 100
#define ROW_WIDTH ROW_HEIGHT
#define CELL_SPACING 10

@interface MultiKCMainViewController (){
    NSMutableArray *_imageViews;
}

@end

@implementation MultiKCMainViewController

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
}

#pragma mark 将图片显示到界面
-(void)updateImage:(KCImageData *)imageData{
    UIImage *image=[UIImage imageWithData:imageData.data];
    UIImageView *imageView= _imageViews[imageData.index];
    imageView.image=image;
}

#pragma mark 请求图片数据
-(NSData *)requestData:(int )index{
    //对非最后一张图片加载线程休眠2秒,这样处理的结果是基本都是最后一张图先加载，这种方法可以控制想加载的顺序
//    if (index!=(ROW_COUNT*COLUMN_COUNT-1)) {
//        [NSThread sleepForTimeInterval:2.0];
//    }
//    
    NSURL *url=[NSURL URLWithString:@"http://ww3.sinaimg.cn/mw1024/bc254b75jw1f53slqbts3j203d03da9v.jpg"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    return data;
}

#pragma mark 加载图片
-(void)loadImage:(NSNumber *)index{
    //    NSLog(@"%i",i);
    //currentThread方法可以取得当前操作线程
    NSLog(@"current thread:%@",[NSThread currentThread]);
    
    int i=(int)[index integerValue];
    
    NSLog(@"%i",i);//未必按顺序输出
    
    NSData *data= [self requestData:i];
    
    KCImageData *imageData=[[KCImageData alloc]init];
    imageData.index=i;
    imageData.data=data;
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:imageData waitUntilDone:YES];
}

#pragma mark 多线程下载图片
-(void)loadImageWithMultiThread{
    //创建多个线程用于填充图片
    for (int i=0; i<ROW_COUNT*COLUMN_COUNT; ++i) {
        //[NSThread detachNewThreadSelector:@selector(loadImage:) toTarget:self withObject:[NSNumber numberWithInt:i]];
        NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage:) object:[NSNumber numberWithInt:i]];
        thread.name=[NSString stringWithFormat:@"myThread%i",i];//设置线程名称
        [thread start];
    }
    
    /*****************************
     这种方法效果同上，用的是NSObject分类扩展方法
     - (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg：在后台执行一个操作，本质就是重新创建一个线程执行当前方法。
     
     - (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait：在指定的线程上执行一个方法，需要用户创建一个线程对象。
     
     - (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait：在主线程上执行一个方法（前面已经使用过）。
     
    for (int i=0; i<ROW_COUNT*COLUMN_COUNT; ++i) {
        [self performSelectorInBackground:@selector(loadImage:) withObject:[NSNumber numberWithInt:i]];
    }
     *****************************/
}





/****************************
 NOTE:
 从上面的运行效果大家不难发现，图片并未按顺序加载，原因有两个：
 第一，每个线程的实际执行顺序并不一定按顺序执行（虽然是按顺序启动）；
 第二，每个线程执行时实际网络状况很可能不一致。当然网络问题无法改变，只能尽可能让网速更快，但是可以改变线程的优先级，让15个线程优先执行某个线程。线程优先级范围为0~1，值越大优先级越高，每个线程的优先级默认为0.5。修改图片下载方法如下，改变最后一张图片加载的优先级，这样可以提高它被优先加载的几率，但是它也未必就第一个加载。因为首先其他线程是先启动的，其次网络状况我们没办法修改：
 ****************************/

//-(void)loadImageWithMultiThread{
//    NSMutableArray *threads=[NSMutableArray array];
//    int count=ROW_COUNT*COLUMN_COUNT;
//    //创建多个线程用于填充图片
//    for (int i=0; i<count; ++i) {
//        //        [NSThread detachNewThreadSelector:@selector(loadImage:) toTarget:self withObject:[NSNumber numberWithInt:i]];
//        NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage:) object:[NSNumber numberWithInt:i]];
//        thread.name=[NSString stringWithFormat:@"myThread%i",i];//设置线程名称
//        if(i==(count-1)){
//            thread.threadPriority=1.0;
//        }else{
//            thread.threadPriority=0.0;
//        }
//        [threads addObject:thread];
//    }
//    
//    for (int i=0; i<count; i++) {
//        NSThread *thread=threads[i];
//        [thread start];
//    }
//}

@end
