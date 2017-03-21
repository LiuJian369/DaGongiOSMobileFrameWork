//
//  JSPatchHelper.m
//  MobileProject
//
//  Created by wujunyang on 16/6/13.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "JSPatchHelper.h"
#import "Macros.h"
#import "GVUserDefaults+BBProperties.h"
#import <AFNetworking/AFNetworking.h>
#import "ThirdMacros.h"

//文件名称
static NSString * const jsPatchJsFileName=@"main.js";

@implementation JSPatchHelper

+ (instancetype)sharedInstance
{
    static JSPatchHelper* instance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [JSPatchHelper new];
    });

    return instance;
}


+(void)HSDevaluateScript
{
    //从本地获取下载的JS文件
    NSURL *p = FilePath;
    
    //判断文件是否存在
    NSString *curFilePath=[p.path stringByAppendingString:[NSString stringWithFormat:@"/%@",jsPatchJsFileName]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:curFilePath]) {
        return;
    }
    
    //获取内容
    NSString *js = [NSString stringWithContentsOfFile:curFilePath encoding:NSUTF8StringEncoding error:nil];
    
    //如果有内容
    if (js.length > 0)
    {
        //-------
        //服务端要对JS内容进行加密，在此处解密js内容；增加安全性
        //----
        
        
        //运行
        [JPEngine startEngine];
        [JPEngine evaluateScript:js];
    }
}


+(void)loadJSPatch
{
    //优化间隔一段时间 再去请求一次 否则太频繁(这边定义为一个小时才去请求一次)
    NSDate *myNowDate=[NSDate date];
    if (!BBUserDefault.MBJsPatchTime) {
        BBUserDefault.MBJsPatchTime=myNowDate;
    }
    NSLog(@"%@",BBUserDefault.MBJsPatchTime);
    if ([myNowDate timeIntervalSinceDate:BBUserDefault.MBJsPatchTime]<3600) {
        return;
    }
    
    //重新赋值
    BBUserDefault.MBJsPatchTime=myNowDate;
    
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.确定请求的URL地址
    NSURL *URL = [NSURL URLWithString:kJSPatchServerPath];
    //3.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    //下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //打印下下载进度
        NSLog(@"%lf",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //下载地址
        NSLog(@"默认下载地址:%@",targetPath);
        NSURL *documentsDirectoryURL = FilePath;
        //保存到本地 Library/Caches目录下
        return [documentsDirectoryURL URLByAppendingPathComponent:jsPatchJsFileName];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        //下载完成调用的方法
        NSLog(@"下载完成：");
        NSLog(@"%@--%@",response,filePath);
        
    }];
    
    //开始启动任务
    [task resume];
}


@end
