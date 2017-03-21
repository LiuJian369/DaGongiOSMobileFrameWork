//
//  AccessPhotoViewController.h
//  Ratings
//
//  Created by gwb on 15/12/14.
//  Copyright (c) 2015年 gwb. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AccessPhotoViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (retain, nonatomic) IBOutlet UIImageView *imageView;	
@end
