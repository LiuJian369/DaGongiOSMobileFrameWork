#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface STCommonUtil : NSObject
#pragma mark - Image Util
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end