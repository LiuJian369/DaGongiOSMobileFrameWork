//
//  SecondViewController.m
//  UIPresentationController
//
//  Created by ChenWei on 16/5/18.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "SecondViewController.h"
#import "PresentationController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
    self.view.backgroundColor = [UIColor blueColor];
    self.view.bounds = CGRectMake(0, 0, 350, 400);
    
   
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.frame = CGRectMake(50, 80, 0, 0);
    [btn2 setTitle:@"sizeChange" forState:UIControlStateNormal];
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(sizeChanged) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)sizeChanged {
    CGRect rect = self.view.frame;
    rect.size.height -= 120;
    
    __weak typeof(self) weakS = self;
    [UIView animateWithDuration:5 animations:^{
        weakS.view.frame = rect;
    }];
}

- (CGSize)preferredContentSize {
    return self.view.bounds.size;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
