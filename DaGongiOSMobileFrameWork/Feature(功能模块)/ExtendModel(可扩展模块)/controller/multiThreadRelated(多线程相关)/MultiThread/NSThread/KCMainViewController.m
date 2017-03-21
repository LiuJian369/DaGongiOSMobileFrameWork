//
//  KCMainViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "KCMainViewController.h"

@interface KCMainViewController (){
    UIImageView *_imageView;
}

@end


@implementation KCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutUI];
}

#pragma mark 界面布局
-(void)layoutUI{
    _imageView =[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    _imageView.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 500, 220, 25);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame=CGRectMake(50, 100, 220, 25);
    [button2 setTitle:@"测试主线程是否卡顿" forState:UIControlStateNormal];
    //添加方法
    [button2 addTarget:self action:@selector(showLabel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}


-(void) showLabel{
    
    UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    label.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:label];

}


#pragma mark 将图片显示到界面
-(void)updateImage:(NSData *)imageData{
    UIImage *image=[UIImage imageWithData:imageData];
    _imageView.image=image;
}

#pragma mark 请求图片数据
-(NSData *)requestData{
    NSURL *url=[NSURL URLWithString:@"http://ww1.sinaimg.cn/mw1024/bc254b75jw1f53r7xv674j20go08rweu.jpg"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    return data;
}

#pragma mark 加载图片
-(void)loadImage{
    //请求数据
    NSData *data= [self requestData];
    /*将数据显示到UI控件,注意只能在主线程中更新UI,
     另外performSelectorOnMainThread方法是NSObject的分类方法，每个NSObject对象都有此方法，
     它调用的selector方法是当前调用控件的方法，例如使用UIImageView调用的时候selector就是UIImageView的方法
     Object：代表调用方法的参数,不过只能传递一个参数(如果有多个参数请使用对象进行封装)
     waitUntilDone:是否线程任务完成执行
     */
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:data waitUntilDone:YES];
}

#pragma mark 多线程下载图片
-(void)loadImageWithMultiThread{
    //方法1：使用对象方法
    //创建一个线程，第一个参数是请求的操作，第二个参数是操作方法的参数
    //    NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage) object:nil];
    //    //启动一个线程，注意启动一个线程并非就一定立即执行，而是处于就绪状态，当系统调度时才真正执行
    //    [thread start];
    
    //方法2：使用类方法
    [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
}
@end
