//
//  ShowLocationViewController.m
//  Ratings
//
//  Created by gwb on 15/12/4.
//  Copyright (c) 2015年 gwb. All rights reserved.
//

#import "ShowLocationViewController.h"
#import "AppDelegate.h"
#import "CommonConfig.h"

@interface ShowLocationViewController ()

@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;
@property (nonatomic,strong) UIButton *locationButton;

@end

@implementation ShowLocationViewController
@synthesize mapView = _mapView;
@synthesize locationManager = _locationManager;


- (void) viewDidLoad{
    [super viewDidLoad];
    [self initMapView];
    [self initCompleteBlock];
    [self initLocationManager];
    [self startLocButton];
    [self showLongitudeAndLatitudeButton];
}


- (void)initMapView{
//    [AMapLocationRegion sharedServices].apiKey =@"ce4b0fce2574364c009f36f061b1c799";
//    [MAMapServices sharedServices].apiKey = @"ce4b0fce2574364c009f36f061b1c799";
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    self.mapView.compassOrigin = CGPointMake(_mapView.compassOrigin.x, 22);
    self.mapView.scaleOrigin = CGPointMake(_mapView.scaleOrigin.x, 22);
    [self.view addSubview:_mapView];
    
}


- (void)initLocationManager{
    self.locationManager = [[AMapLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    [self.locationManager setAllowsBackgroundLocationUpdates:YES];
}


-(void) startLocButton{
    _locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _locationButton.frame = CGRectMake(0, CGRectGetHeight(_mapView.bounds) - 30, 120, 30);
    _locationButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin;
    _locationButton.backgroundColor = NAVBLUECOLOR;
    _locationButton.layer.cornerRadius = 5;
    [_locationButton addTarget:self action:@selector(reGeocodeAction)
              forControlEvents:UIControlEventTouchUpInside];
    [_locationButton setTitle:@"一次定位" forState:UIControlStateNormal];
    [_mapView addSubview:_locationButton];
    
}

-(void) showLongitudeAndLatitudeButton{
    _locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _locationButton.frame = CGRectMake(0, CGRectGetHeight(_mapView.bounds)-70, 120, 30);
    _locationButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin;
    _locationButton.backgroundColor = NAVBLUECOLOR;
    _locationButton.layer.cornerRadius = 5;
    [_locationButton addTarget:self action:@selector(showLongitudeAndLatitude)
              forControlEvents:UIControlEventTouchUpInside];
    [_locationButton setTitle:@"经纬度信息" forState:UIControlStateNormal];
    [_mapView addSubview:_locationButton];
    
}

-(void) showLongitudeAndLatitude{
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
        if (error){
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            
            if (error.code == AMapLocationErrorLocateFailed){
                return;
                }
            }
        
        NSLog(@"location:%@", location);
        
        if (regeocode){
            NSLog(@"reGeocode:%@", regeocode);
            }
    }];

}


- (void)reGeocodeAction{
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:self.completionBlock];
}


- (void)returnAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self clearMapView];
    
    [self clearLocationManager];
}


- (void)clearMapView{
    
    self.mapView.showsUserLocation = NO;
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    [self.mapView removeOverlays:self.mapView.overlays];
    
    self.mapView.delegate = nil;
}


- (void)clearLocationManager{
    
    [self.locationManager stopUpdatingLocation];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager setPausesLocationUpdatesAutomatically:YES];
    [self.locationManager setAllowsBackgroundLocationUpdates:NO];
    self.locationManager.delegate = nil;
}


- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{
    
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
        {
        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
        
        MAPinAnnotationView *annotationView = (MAPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
        if (annotationView == nil)
            {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
            }
        
        annotationView.canShowCallout   = YES;
        annotationView.animatesDrop     = YES;
        annotationView.draggable        = NO;
        annotationView.pinColor         = MAPinAnnotationColorPurple;
        
        return annotationView;
        }
    
    return nil;
}

- (void)addAnnotationToMapView:(id<MAAnnotation>)annotation{
    
    [self.mapView addAnnotation:annotation];
    [self.mapView selectAnnotation:annotation animated:YES];
    [self.mapView setZoomLevel:15.1 animated:NO];
    [self.mapView setCenterCoordinate:annotation.coordinate animated:YES];
}

- (void)initCompleteBlock{
    
    __weak ShowLocationViewController *wSelf = self;
    self.completionBlock = ^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error)
    {
    if (error)
        {
        NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
        
        if (error.code == AMapLocationErrorLocateFailed)
            {
            return;
            }
        }
    
    if (location)
        {
        MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
        [annotation setCoordinate:location.coordinate];
        
        if (regeocode)
            {
            [annotation setTitle:[NSString stringWithFormat:@"%@", regeocode.formattedAddress]];
            [annotation setSubtitle:[NSString stringWithFormat:@"%@-%@-%.2fm", regeocode.citycode, regeocode.adcode, location.horizontalAccuracy]];
            }
        else
            {
            [annotation setTitle:[NSString stringWithFormat:@"lat:%f;lon:%f;", location.coordinate.latitude, location.coordinate.longitude]];
            [annotation setSubtitle:[NSString stringWithFormat:@"accuracy:%.2fm", location.horizontalAccuracy]];
            }
        
        ShowLocationViewController *sSelf = wSelf;
        [sSelf addAnnotationToMapView:annotation];
        }
    };
}
@end
