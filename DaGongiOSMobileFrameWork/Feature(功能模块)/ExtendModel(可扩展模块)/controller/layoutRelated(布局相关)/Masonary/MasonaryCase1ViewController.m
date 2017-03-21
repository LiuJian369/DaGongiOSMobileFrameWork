//
//  MasonaryCase1ViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "MasonaryCase1ViewController.h"
#import "Masonry.h"
#import "CommonConfig.h"
#import "MMPlaceHolder.h"
#import "UIView+LJC.h"

@implementation MasonaryCase1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *segmentArray = @[
                              @"case1",
                              @"case2",
                              @"case3",
                              @"case4",
                              @"case5",
                              @"case6"
                              ];
    // 初始化UISegmentedControl
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:segmentArray];
    // 设置默认选择项索引
    segmentControl.selectedSegmentIndex = 0;
    segmentControl.tintColor = [UIColor blueColor];
    // 设置在点击后是否恢复原样
    segmentControl.momentary = NO;
    // 添加监听
    [segmentControl addTarget:self action:@selector(didClickSegmentedControlAction:)forControlEvents:UIControlEventValueChanged];
    //方法1：但是显示在导航栏的右边
    //  UIBarButtonItem *segButton = [[UIBarButtonItem alloc] initWithCustomView:segmentControl];
    //  self.navigationItem.rightBarButtonItem = segButton;
   
    //方法2：直接用titleview
    [self.navigationItem setTitleView:segmentControl];
    [self case1];
    
}


-(void) case1{
    // 防止block中的循环引用
    __weak typeof(self) weakSelf = self;
    // 初始化view并设置背景
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    [view showPlaceHolder];
    [self.view addSubview:view];
    // 使用mas_makeConstraints添加约束
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        // 添加大小约束（make就是要添加约束的控件view）
        make.size.mas_equalTo(CGSizeMake(100, 100));
        // 添加居中约束（居中方式与self相同）
        make.center.equalTo(weakSelf.view);
    }];
    
    // 初始化黑色view
    UIView *blackView = [UIView new];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    [blackView showPlaceHolder];
    
    // 给黑色view添加约束
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 添加大小约束
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(120);
    }];
    
    // 初始化灰色view
    UIView *grayView = [UIView new];
    grayView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayView];
    [grayView showPlaceHolder];
    // 给灰色view添加约束
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 大小、上边距约束与黑色view相同
        make.size.and.top.equalTo(blackView);
        // 添加右边距约束（这里的间距是有方向性的，左、上边距约束为正数，右、下边距约束为负数）
        make.right.mas_equalTo(-20);
    }];

}

-(void) case2{

    UIView *sv = [UIView new];
    [sv showPlaceHolder];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    UIView *sv1 = [UIView new];
    [sv1 showPlaceHolder];
    sv1.backgroundColor = [UIColor redColor];
    [sv addSubview:sv1];
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
        /* 等价于
         make.top.equalTo(sv).with.offset(10);
         make.left.equalTo(sv).with.offset(10);
         make.bottom.equalTo(sv).with.offset(-10);
         make.right.equalTo(sv).with.offset(-10);
         */
        
        /* 也等价于
         make.top.left.bottom.and.right.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
         */
    }];

}

//让两个高度为150的view垂直居中且等宽且等间隔排列 间隔为10(自动计算其宽度)
-(void) case3{
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(320, 400));
    }];
    
    int padding1 = 10;
    
    UIView *sv2 = [UIView new];
    [sv2 showPlaceHolder];
    sv2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:sv2];
    
    UIView *sv3 = [UIView new];
    [sv3 showPlaceHolder];
    sv3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:sv3];
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv.mas_left).with.offset(padding1);
        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv3);
    }];
    
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv2.mas_right).with.offset(padding1);
        make.right.equalTo(sv.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv2);
    }];
}


- (void) case4{
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [sv addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(5,5,5,5));
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;
    
    UIView *lastView = nil;
    
    for ( int i = 1 ; i <= count ; ++i )
    {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if ( lastView )
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        
        lastView = subv;
    }
    
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
}

//横向或者纵向等间隙的排列一组view，这个功能是作者通过一个分类实现的
- (void) case5{
    
    UIView *sv = [UIView new];
    [sv showPlaceHolder];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    
    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    
    [sv addSubview:sv11];
    [sv addSubview:sv12];
    [sv addSubview:sv13];
    [sv addSubview:sv21];
    [sv addSubview:sv31];
    
    //给予不同的大小 测试效果
    
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    
    [sv distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [sv distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];
    
    [sv showPlaceHolderWithAllSubviews];
    [sv hidePlaceHolder];

}

//masonary 制作九宫格布局
-(void) case6{
    NSMutableArray *array=[NSMutableArray arrayWithArray:@[@"111",@"222",@"333",@"444",@"555",@"666",@"777",@"888",@"999"]];
    NSInteger columns = 4;
    NSInteger rows = ceilf(array.count/(columns*1.0));
    
    UIView * firstView;
    UIView * leftView;
    UIView * topView;
    
//    CGFloat width = CGRectGetWidth(self.view.frame)/columns;
    CGFloat height = 60;
    CGFloat leftSpace = 30;
    CGFloat rightSpace = 30;
    CGFloat topSpace = 50;
//    CGFloat bottomSpace = 0;
    CGFloat innerHSpcae = 30;
    CGFloat innerVSpace = 50;
    
    for (NSInteger i = 0; i<rows; i++) {
        for (NSInteger j = 0; j<columns && (i*columns+j)<array.count; j++) {
            UILabel * l = [[UILabel alloc] init];
            l.text = array[i*columns+j];
            l.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
            [self.view addSubview:l];
            
            [l mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(height);
            }];
            
            if(leftView){
                [l mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(leftView.mas_right).offset(innerHSpcae);
                }];
            }else{
                [l mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(self.view).offset(leftSpace);
                }];
            }
            
            if (topView) {
                [l mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(topView.mas_bottom).offset(innerVSpace);
                }];
            }else{
                [l mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self.view).offset(topSpace);
                }];
            }
            
            leftView = l;
            
            if (j == columns-1) {
                [l mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_equalTo(self.view).offset(-rightSpace);
                }];
                topView = l;
                leftView = nil;
            }
            
            if (i == 0 && j == 0) {
                firstView = l;
            }else{
                [l mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo(firstView.mas_width);
                }];
            }
            
        }
    }


}




-(void) removeView{
    for(UIView *view in self.view.subviews){
        [ view removeFromSuperview];
    }
}

- (void)didClickSegmentedControlAction:(UISegmentedControl *)segmentControl
{
    NSInteger idx = segmentControl.selectedSegmentIndex;
    
    switch (idx) {
        case 0:
            [self removeView];
            [self case1];
            break;
            
        case 1:
            [self removeView];
            [self case2];
            break;
            
        case 2:
            [self removeView];
            [self case3];
            break;
            
        case 3:
            [self removeView];
            [self case4];
            break;
            
        case 4:
            [self removeView];
            [self case5];
            break;
            
        case 5:
            [self removeView];
            [self case6];
            break;
        
        default:
            break;
    }
    
}

@end
