//
//  ViewControllerLifeCycle.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 DaGong. All rights reserved.
//


// note：这个示例主要用于展示ViewController的生命周期。


#import "ViewControllerLifeCycle.h"

@implementation ViewControllerLifeCycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"initWithNibName");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)loadView
{
    NSLog(@"loadView");
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    contentView.backgroundColor = [UIColor blueColor];
    self.view = contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"View Did Load");
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"View Will Appear");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"View Did Appear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"View Will Disappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"View Did Disappear");
}

-(void)dealloc
{
    NSLog(@"delloc");

}
@end
