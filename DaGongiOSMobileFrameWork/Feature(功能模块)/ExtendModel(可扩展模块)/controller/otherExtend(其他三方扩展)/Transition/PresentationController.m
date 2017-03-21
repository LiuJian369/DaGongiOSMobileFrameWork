//
//  PresentationController.m
//  UIPresentationController
//
//  Created by ChenWei on 16/5/19.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "PresentationController.h"
//#import "SecondViewController.h"

@interface PresentationController ()

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@end

@implementation PresentationController

// MARK:
- (void)presentationTransitionWillBegin {
    NSLog(@"%s", __func__);
    
    self.containerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    self.tap = tap;
    
    if (self.tap) {
        [self.containerView addGestureRecognizer:self.tap];
    }
}



- (void)dismissalTransitionDidEnd:(BOOL)completed {
    [self.containerView removeGestureRecognizer:self.tap];
    self.tap = nil;
    
    
    
}

- (void)tapGesture:(UITapGestureRecognizer *)tap {
    
    [self.presentedViewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"done");
    }];

}

// MARK: Properties
- (UIView *)containerView {
     NSLog(@"%s", __func__);
   return  [super containerView];
}

// MARK: Method
- (CGRect)frameOfPresentedViewInContainerView {
     NSLog(@"%s", __func__);
    CGRect rect = {CGPointMake(12.5, 50), self.presentedViewController.preferredContentSize};
    return rect;
}

- (void)containerViewWillLayoutSubviews {
    NSLog(@"%s", __func__);
    [super containerViewWillLayoutSubviews];
}
- (void)containerViewDidLayoutSubviews {
     NSLog(@"%s", __func__);
    [super containerViewDidLayoutSubviews];
}


// MARK: UIViewControllerTransitioningDelegate
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return self;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id<UIContentContainer>)container {
    NSLog(@"%s", __func__);
}


@end
