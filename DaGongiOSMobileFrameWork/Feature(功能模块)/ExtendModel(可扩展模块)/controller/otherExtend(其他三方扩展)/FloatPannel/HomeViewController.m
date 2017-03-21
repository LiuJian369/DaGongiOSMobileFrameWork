//
//  HomeViewController.m
//  GMSidePanelDemo
//
//  Created by gamin on 15/6/24.
//  Copyright (c) 2015年 gamin. All rights reserved.
//

#import "HomeViewController.h"
#import "JASidePanelController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftPanelAction:(id)sender {
    [[JASidePanelController share] toggleLeftPanel:nil];

}

- (IBAction)rightPanelAction:(id)sender {
    [[JASidePanelController share] toggleRightPanel:nil];
}

@end
