//
//  CycleScrollViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/15.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "CycleScrollViewController.h"
#import "CLRollLabel.h"
#import "CMMessageTipsView.h"
#import "NewsBanner.h"

@interface CycleScrollViewController ()<NewsBannerDelegate>
@property(nonatomic,strong) NSMutableArray *messageArray;
@property(nonatomic,strong) CLRollLabel *rollLabel;
@property(nonatomic,strong)CMMessageTipsView *tipsView;

@end

@implementation CycleScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _messageArray = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        [_messageArray addObject:[NSString stringWithFormat:@"这是第%d个",i]];
    }
    self.cell = [[YYCycleViewCell alloc] initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width , 30)];
    
    self.cell.backgroundColor = [UIColor whiteColor];
    self.cell.contentArray = _messageArray;
    [self.cell.cyclelView startAnimation];
    
    [self.view addSubview:self.cell];
    
    
    self.rollLabel = [[CLRollLabel alloc] initWithFrame:CGRectMake(10, 300, 200, 50) font:[UIFont systemFontOfSize:17] textColor:[UIColor redColor]];
    self.rollLabel.backgroundColor = [UIColor blackColor];
    self.rollLabel.text = @"abcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyz";
    [self.view addSubview:self.rollLabel];
    
    
    
    [self creatButton];
    
    
    
    NSMutableArray *messageArray = [NSMutableArray array];
    [messageArray addObject:@"first"];
    [messageArray addObject:@"second"];
    [messageArray addObject:@"third"];
    _tipsView = [[CMMessageTipsView alloc]initWithFrame:CGRectMake(20, 100, 90, 25)];
    _tipsView.backgroundColor = [UIColor redColor];
    _tipsView.Delay = 2;
    [_tipsView showTips:messageArray];
    [self.view addSubview:_tipsView];
    
    
    NewsBanner *newsView = [[NewsBanner alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 20 )];
    
    newsView.noticeList = @[@"月牙泉再现罕见铁背鱼 已销声匿迹多年",@"中国警察首次巡逻罗马和米兰",@"台湾coser遭摄影师出卖 众多大尺度私照流出",@"韩最任性女主播曝私照 网友：皮卡丘都撑变形了",@"宋仲基与前女友大头贴曝光 你们给她的颜值打几分"];
    newsView.duration = 2;
    [self.view addSubview:newsView];
    newsView.delegate = self;
    [newsView star];
    
    
}



- (void)NewsBanner:(NewsBanner *)newsBanner didSelectIndex:(NSInteger)selectIndex
{
    NSLog(@"%ld",selectIndex);
}


- (void)creatButton{
    UIButton* button = [UIButton new];
    button.frame = CGRectMake(100, 400, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"更换文字" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)clickButtonAction{
    self.rollLabel.text = @"---add-sa-dsadasda-das-d-as-das-dasd-avcxv-d-ffsfas";
}
@end
