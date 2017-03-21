//
//  CYLTabBarControllerConfig.m
//  CYLTabBarController
//
#import "CYLTabBarControllerConfig.h"
#import "GwbNavigationController.h"

@import Foundation;
@import UIKit;

@interface CYLBaseNavigationController : GwbNavigationController
@end
@implementation CYLBaseNavigationController
@end

//View Controllers
#import "CYLHomeViewController.h"
#import "CYLMessageViewController.h"
#import "CYLMineViewController.h"
#import "CYLSameCityViewController.h"
#import "TestViewController.h"
#import "SystemModelViewController.h"
#import "BaseModuleViewController.h"
#import "ExtendModuleViewController.h"

@interface CYLTabBarControllerConfig ()

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end

@implementation CYLTabBarControllerConfig

- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        ExtendModuleViewController *firstViewController = [[ExtendModuleViewController alloc] init];
        UIViewController *firstNavigationController = [[CYLBaseNavigationController alloc]
                                                       initWithRootViewController:firstViewController];
        
        BaseModuleViewController *secondViewController = [[BaseModuleViewController alloc] init];
        UIViewController *secondNavigationController = [[CYLBaseNavigationController alloc]
                                                        initWithRootViewController:secondViewController];
        
//        BaseModelViewController *thirdViewController = [[BaseModelViewController alloc] init];
//        UIViewController *thirdNavigationController = [[CYLBaseNavigationController alloc]
//                                                        initWithRootViewController:thirdViewController];
//        
//        
//        SystemModelViewController *fourthViewController = [[SystemModelViewController alloc] init];
//        UIViewController *fourthNavigationController = [[CYLBaseNavigationController alloc]
//                                                        initWithRootViewController:fourthViewController];
        
        CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
        
        /**
         * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
         * 等效于在`-setUpTabBarItemsAttributesForController`方法中不传`CYLTabBarItemTitle`字段。
         * 更推荐后一种做法。
         */
        //tabBarController.imageInsets = UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        //tabBarController.titlePositionAdjustment = UIOffsetMake(0, MAXFLOAT);
        
        // 在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
        [self setUpTabBarItemsAttributesForController:tabBarController];
        
        [tabBarController setViewControllers:@[
                                               secondNavigationController,
                                               firstNavigationController
//                                               thirdNavigationController,
//                                               fourthNavigationController
                                               ]];
        // 更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

/**
 *  在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
 */
- (void)setUpTabBarItemsAttributesForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"扩展",
                            CYLTabBarItemImage : @"mycity_normal",
                            CYLTabBarItemSelectedImage : @"mycity_highlight",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"基础",
                            CYLTabBarItemImage : @"home_normal",
                            CYLTabBarItemSelectedImage : @"home_highlight",
                            };
    
//    NSDictionary *dict3 = @{
//                            CYLTabBarItemTitle : @"系统",
//                            CYLTabBarItemImage : @"account_normal",
//                            CYLTabBarItemSelectedImage : @"account_highlight"
//                            };
//    
//    NSDictionary *dict4 = @{
//                            CYLTabBarItemTitle : @"系统",
//                            CYLTabBarItemImage : @"account_normal",
//                            CYLTabBarItemSelectedImage : @"account_highlight"
//                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict2,
                                       dict1
//                                       dict3,
//                                       dict4
                                       ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    #warning CUSTOMIZE YOUR TABBAR APPEARANCE
    // Customize UITabBar height
    // 自定义 TabBar 高度
     tabBarController.tabBarHeight = 50.f;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
//     UITabBar *tabBarAppearance = [UITabBar appearance];
//     [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tarbarplusbgcolor"]];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait){
            NSLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    UITabBarController *tabBarController = [self cyl_tabBarController] ?: [[UITabBarController alloc] init];
    CGFloat tabBarHeight = tabBarController.tabBar.frame.size.height;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor redColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
