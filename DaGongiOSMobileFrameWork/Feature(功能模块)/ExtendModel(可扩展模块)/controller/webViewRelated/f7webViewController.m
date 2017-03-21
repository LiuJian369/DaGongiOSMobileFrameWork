//
//  f7webViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/11/10.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "f7webViewController.h"

@interface f7webViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *myWebView;
@end

@implementation f7webViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"与H5进行交互";
    
    //布局
    [self layoutWebPage];
    
    //加载Html页面
    [self loadExamplePage];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"开启加载");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"结束加载");
}

//布局视图
-(void)layoutWebPage{
    if (!self.myWebView){
        self.myWebView=[[UIWebView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:self.myWebView];
    }
}

//加载实例Html
-(void)loadExamplePage{
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"f7index" ofType:@"html"];
    NSString * appHtml  = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    if(htmlPath.length==0){
        return;
    }
    NSURL *baseURL = [NSURL fileURLWithPath:htmlPath];
    [self.myWebView loadHTMLString:appHtml baseURL:baseURL];
}

@end
