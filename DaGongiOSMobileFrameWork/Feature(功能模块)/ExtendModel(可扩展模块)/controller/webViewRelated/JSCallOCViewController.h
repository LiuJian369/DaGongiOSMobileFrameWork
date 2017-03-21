//
//  JSCallOCViewController.h
//  DaGongiOSMobileFrameWork
//
//  Created by 刘建 on 16/11/15.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol TestJSExport <JSExport>
JSExportAs
(calculateForJS  /** handleFactorialCalculateWithNumber 作为js方法的别名 */,
 - (void)handleFactorialCalculateWithNumber:(NSNumber *)number
 );
- (void)pushViewController:(NSString *)view title:(NSString *)title;
@end

@interface JSCallOCViewController : UIViewController<UIWebViewDelegate,TestJSExport>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) JSContext *context;
@end
