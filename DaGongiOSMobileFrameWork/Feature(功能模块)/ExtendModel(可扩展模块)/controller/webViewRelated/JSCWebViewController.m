//
//  JSCWebViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by 刘建 on 16/11/15.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "JSCWebViewController.h"
#import "JSCallOCViewController.h"
#import "OCCallJSViewController.h"
#import "HighchartsWebViewController.h"

@interface JSCWebViewController ()

@end

@implementation JSCWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)JSCallOC:(id)sender {
    JSCallOCViewController *jsCallOC = [[JSCallOCViewController alloc]init];
    [self.navigationController pushViewController:jsCallOC animated:YES];
    
}

- (IBAction)OCCallJS:(id)sender {
    
    OCCallJSViewController *ocCallJS = [[OCCallJSViewController alloc]init];
    [self.navigationController pushViewController:ocCallJS animated:YES];
}

- (IBAction)HighchartsWeb:(id)sender {
    HighchartsWebViewController *highchartsWeb =[[HighchartsWebViewController alloc]init];
    [self.navigationController pushViewController:highchartsWeb animated:YES];
    
}
@end
