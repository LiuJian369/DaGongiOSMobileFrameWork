//
//  OCCallJSViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by 刘建 on 16/11/15.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "OCCallJSViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface OCCallJSViewController ()

@property (nonatomic, strong) JSContext *context;

@end

@implementation OCCallJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"OC call JS";
    self.context = [[JSContext alloc]init];
    [self.context evaluateScript:[self loadJsFile:@"test"]];//将JS代码加载到context里面
}

//从文件中取JS代码
- (NSString *)loadJsFile:(NSString*)fileName{
    NSString *path     = [[NSBundle mainBundle] pathForResource:fileName ofType:@"js"];
    NSString *jsScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return jsScript;
}


- (IBAction)sendToJS:(id)sender {
    NSNumber *inputNumber = [NSNumber numberWithInteger:[self.textField.text integerValue]];
    JSValue *function = [self.context objectForKeyedSubscript:@"factorial"];
    JSValue *result = [function callWithArguments:@[inputNumber]];
    self.showLabel.text = [NSString stringWithFormat:@"%@", [result toNumber]];
}


@end
