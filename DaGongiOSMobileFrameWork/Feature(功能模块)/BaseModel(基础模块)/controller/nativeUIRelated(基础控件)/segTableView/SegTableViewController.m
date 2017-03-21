//
//  SegTableViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/22.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "SegTableViewController.h"
#import "CommonConfig.h"
#import "XibTableViewController2.h"
#import "XibTableViewController.h"
#import "Masonry.h"

@interface SegTableViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl1;
@end

@implementation SegTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 220, SCREEN_WIDTH, self.view.frame.size.height-50)];
    self.scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, 200);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, SCREEN_WIDTH, 200) animated:NO];
    [self.view addSubview:self.scrollView];
    
    

    [self setUpSegView];
    [self setUpTableView];
}


- (void) setUpTableView{
    XibTableViewController  *todo = [[XibTableViewController alloc] init];
    todo.view.autoresizingMask = UIViewAutoresizingNone;
    [self addChildViewController:todo];
    todo.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    [self.scrollView addSubview:todo.view];
    
    
    XibTableViewController2  *sal = [[XibTableViewController2 alloc] init];
    sal.view.autoresizingMask = UIViewAutoresizingNone;
    [self addChildViewController:sal];
    sal.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, 200);
    [self.scrollView addSubview:sal.view];
   
    
    XibTableViewController  *mal = [[XibTableViewController alloc] init];
    mal.view.autoresizingMask = UIViewAutoresizingNone;
    [self addChildViewController:mal];
    mal.view.frame = CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, 200);
    [self.scrollView addSubview:mal.view];
   
}

- (void)setUpSegView
{
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    self.segmentedControl1 = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"One", @"Two", @"Three"]];
    self.segmentedControl1.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    self.segmentedControl1.frame = CGRectMake(0, 110, viewWidth, 60);
    self.segmentedControl1.backgroundColor=[UIColor redColor];
    self.segmentedControl1.segmentEdgeInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.segmentedControl1.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.segmentedControl1.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl1.verticalDividerEnabled = YES;
    self.segmentedControl1.verticalDividerColor = [UIColor redColor];
    self.segmentedControl1.verticalDividerWidth = 1.0f;
    [self.segmentedControl1 setTitleFormatter:^NSAttributedString *(HMSegmentedControl *segmentedControl, NSString *title, NSUInteger index, BOOL selected) {
        NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : [UIColor blueColor]}];
        return attString;
    }];
    [self.segmentedControl1 addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl1];
    
    
    [self.segmentedControl1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(180);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH,40));
    }];



}


- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl1 setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH * index, 0, SCREEN_WIDTH, 200) animated:YES];}];
}

- (void)setApperanceForLabel:(UILabel *)label {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    label.backgroundColor = color;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:21.0f];
    label.textAlignment = NSTextAlignmentCenter;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    [self.segmentedControl1 setSelectedSegmentIndex:page animated:YES];
}

@end
