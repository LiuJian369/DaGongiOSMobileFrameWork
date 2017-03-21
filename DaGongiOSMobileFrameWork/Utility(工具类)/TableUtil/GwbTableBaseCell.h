//
//  GwbTableBaseCell.h
//  LightTableViewDemo
//
//  Created by mac on 16/5/26.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GwbTableBaseCell : UITableViewCell

/**
 *  通过数据item更新UI
 *
 *  @param item 数据模型
 */
- (void)configureCellContentWithItem:(id)item;

/**
 *  获取某个cell的高度
 *
 *  @param item 数据模型
 *
 *  @return cell的高度
 */
- (CGFloat)configureCellHeightWithItem:(id)item;

/**
 *  cell点击事件,传入item
 *
 *  @param item 数据模型
 */
- (void)didSelectedWithItem:(id)item;

@end
