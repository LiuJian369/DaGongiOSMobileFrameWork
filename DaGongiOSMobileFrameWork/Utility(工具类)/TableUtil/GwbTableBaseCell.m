//
//  GwbTableBaseCell.m
//  LightTableViewDemo
//
//  Created by mac on 16/5/26.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "GwbTableBaseCell.h"

@implementation GwbTableBaseCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCellContentWithItem:(id)item{
    
}

- (CGFloat)configureCellHeightWithItem:(id)item{
    return 40.0f;
}

- (void)didSelectedWithItem:(id)item{
}

@end
