//
//  MapShowViewController.m
//  Ratings
//
//  Created by gwb on 15/9/9.
//  Copyright (c) 2015年 gwb. All rights reserved.
//

#import "MapShowViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import "ShowLocationViewController.h"
#import "CommonConfig.h"


@interface MapShowViewController ()

@end

@implementation MapShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMapView];

}
-(void)initMapView{
  //  [MAMapServices sharedServices].apiKey = @"ce4b0fce2574364c009f36f061b1c799";
    self.mapView= [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
}
@end
