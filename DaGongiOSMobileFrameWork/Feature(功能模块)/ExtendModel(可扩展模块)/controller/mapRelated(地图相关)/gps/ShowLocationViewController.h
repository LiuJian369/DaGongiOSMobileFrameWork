//
//  ShowLocationViewController.h
//  Ratings
//
//  Created by gwb on 15/12/4.
//  Copyright (c) 2015年 gwb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface ShowLocationViewController : UIViewController<MAMapViewDelegate, AMapLocationManagerDelegate>

@property (nonatomic, strong) MAMapView *mapView;

@property (nonatomic, strong) AMapLocationManager *locationManager;

- (void)returnAction;

@end
