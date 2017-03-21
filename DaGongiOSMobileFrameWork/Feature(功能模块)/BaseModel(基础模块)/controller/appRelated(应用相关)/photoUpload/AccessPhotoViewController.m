//
//  AccessPhotoViewController.m
//  Ratings
//
//  Created by gwb on 15/12/14.
//  Copyright (c) 2015年 gwb. All rights reserved.
//

#import "AccessPhotoViewController.h"
#import "AppDelegate.h"
#import "CommonConfig.h"
//#import "AFURLSessionManager.h"
//#import "AFHTTPSessionManager.h"
//#import "AFURLRequestSerialization.h"



//@interface AccessPhotoViewController ()<AFURLRequestSerialization,AFURLResponseSerialization>{
//    BOOL isFullScreen;
//}
@interface AccessPhotoViewController (){
    BOOL isFullScreen;
}
@property (strong,nonatomic)UIButton *photoButton;
@property (strong,nonatomic)UIButton *uploadButton;

@end


@implementation AccessPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.photoButton setTitle:@"访问相册" forState:UIControlStateNormal];
    [self.photoButton addTarget:self  action:@selector(chooseImage) forControlEvents:UIControlEventTouchUpInside];
    [self.uploadButton setTitle:@"图片上传" forState:UIControlStateNormal];
    [self.uploadButton addTarget:self action:@selector(uploadImage) forControlEvents:UIControlEventTouchUpInside];
}

- (UIButton *)photoButton{
    if(!_photoButton){
        self.photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.photoButton.frame = CGRectMake(0,0, 150, 30);
        self.photoButton.backgroundColor=NAVBLUECOLOR;
        self.photoButton.center = CGPointMake(self.view.bounds.size.width/2,150);
        [self.view addSubview:self.photoButton];
    }
    return _photoButton;
}

- (UIButton *)uploadButton{
    if(!_uploadButton){
        self.uploadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.uploadButton.frame = CGRectMake(0,0, 150, 30);
        self.uploadButton.backgroundColor=NAVBLUECOLOR;
        self.uploadButton.center = CGPointMake(self.view.bounds.size.width/2,200);
        [self.view addSubview:self.uploadButton];
    }
    return _uploadButton;
}


#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    [imageData writeToFile:fullPath atomically:NO];
}


#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self saveImage:image withName:@"currentImage.png"];
    NSString *fullPath  = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    isFullScreen = NO;
    [self.imageView setImage:savedImage];
    self.imageView.tag = 100;
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    isFullScreen = !isFullScreen;
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    CGPoint imagePoint = self.imageView.frame.origin;
    if(imagePoint.x <= touchPoint.x && imagePoint.x +self.imageView.frame.size.width >=touchPoint.x && imagePoint.y <=  touchPoint.y && imagePoint.y+self.imageView.frame.size.height >= touchPoint.y)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
        if (isFullScreen) {
            self.imageView.frame = CGRectMake(0, 0, 320, 480);
        }
        else {
            self.imageView.frame = CGRectMake(50, 65, 90, 115);
        }
        [UIView commitAnimations];
    }
}


- (void)chooseImage {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}



-(void)uploadImage{
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//    manager.responseSerializer   = [AFHTTPResponseSerializer serializer];
//    NSURL *requestURL =[NSURL URLWithString:@"http://172.16.21.71:8081/DGMobileService/uploadAction!uploadImg.action"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL cachePolicy:0 timeoutInterval:5.0];
//    [request setHTTPMethod:@"POST"];
//    NSURL *filePathURL = [NSURL fileURLWithPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"]];
//    NSURLSessionUploadTask *uploadTask =
//    [manager uploadTaskWithRequest:request
//             fromFile:filePathURL
//             progress:nil
//             completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//                     if (error) {
//                         NSLog(@"Error: %@", error);
//                     } else {
//                         NSLog(@"Success: %@ %@", response, responseObject);
//                     }
//                 }];
//    
//    [uploadTask resume];
    
 
     //代码是好用的，但时需要在xcode7+以上才能运行
//    
//    UIImage *image    = [UIImage imageNamed:@"apple.png"];
//    NSData  *imageData = UIImageJPEGRepresentation(image,0.5);
//    NSString *URLTmp  = @"http://172.16.21.71:8081/DGMobileService/uploadAction!uploadImg.action";
//    NSString *URLTmps = [URLTmp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    URLTmp = URLTmps;
//    NSDictionary *parameters = @{@"filename":@"apple",
//                                 @"filetype":@"png"};
//    
//    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:URLTmp parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileData:imageData name:@"images" fileName:@"imgfilename" mimeType:@"png"];
//    }error:nil];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//     manager.responseSerializer   = [AFHTTPResponseSerializer serializer];
//    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        if (error) {
//            NSLog(@"Error: %@", error);
//        } else {
//            NSLog(@"%@ %@", response, responseObject);
//        }
//    }];
//    
//    [uploadTask resume];
}
@end
