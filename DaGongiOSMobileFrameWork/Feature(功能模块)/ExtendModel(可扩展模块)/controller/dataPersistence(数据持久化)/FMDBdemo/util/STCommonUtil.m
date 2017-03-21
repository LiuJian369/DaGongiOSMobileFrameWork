#import "STCommonUtil.h"

@implementation STCommonUtil


#pragma mark - Image Util
+ (UIImage *)imageWithColor:(UIColor *)color {
    return [STCommonUtil imageWithColor:color size:CGSizeMake(1.0, 1.0)];
}



+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end