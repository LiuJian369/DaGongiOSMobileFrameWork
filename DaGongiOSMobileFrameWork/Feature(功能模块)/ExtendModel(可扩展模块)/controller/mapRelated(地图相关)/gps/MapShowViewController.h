//
//  MapShowViewController.h
//  Ratings
//
//  Created by gwb on 15/9/9.
//  Copyright (c) 2015年 gwb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>

@interface MapShowViewController : UIViewController <MAMapViewDelegate>

@property (strong,nonatomic) MAMapView *mapView;

-(void) initMapView;

@end
