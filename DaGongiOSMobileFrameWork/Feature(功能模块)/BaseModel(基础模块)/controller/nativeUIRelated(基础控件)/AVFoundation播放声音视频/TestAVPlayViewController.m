
//
//  TestAVPlayViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by 刘建 on 16/11/7.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "TestAVPlayViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface TestAVPlayViewController ()

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation TestAVPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 450, 200, 50)];
    [btn1 setTitle:@"跳转播放视频" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor greenColor];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 520, 200, 50)];
    [btn2 setTitle:@"本页播放视频" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor greenColor];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(btnClick2) forControlEvents:UIControlEventTouchUpInside];
    
    NSURL *url = [[NSURL alloc]initWithString:@"http://flv2.bn.netease.com/videolib3/1609/06/UnuGW1312/SD/UnuGW1312-mobile.mp4"];
    // 创建 AVPlayer 播放器
    self.player = [AVPlayer playerWithURL:url];
    
    // 将 AVPlayer 添加到 AVPlayerLayer 上
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    
    
    // 设置播放页面大小
    playerLayer.frame = CGRectMake(0, 30, self.view.bounds.size.width, 300);
    
    // 设置画面缩放模式
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    
    // 在视图上添加播放器
    [self.view.layer addSublayer:playerLayer];
    
}

-(void) btnClick{

    // 加载网络视频
    NSURL *movieUrl = [NSURL URLWithString:@"http://flv2.bn.netease.com/videolib3/1609/06/UnuGW1312/SD/UnuGW1312-mobile.mp4"];

    // 创建播放控制器
    AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];

    playerViewController.player = [AVPlayer playerWithURL:movieUrl];

    // 弹出播放页面
    [self presentViewController:playerViewController animated:YES completion:^{

        // 开始播放
        [playerViewController.player play];
    }];
}

-(void) btnClick2{    

        [self.player play];
}

@end
