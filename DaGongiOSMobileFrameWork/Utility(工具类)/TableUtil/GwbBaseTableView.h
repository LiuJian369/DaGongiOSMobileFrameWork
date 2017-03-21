//
//  GwbBaseTableView.h
//  LightTableViewDemo
//
//  Created by mac on 16/5/26.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GwbTableDataSource.h"

@interface GwbBaseTableView : UITableView

- (instancetype)initWithFrame:(CGRect)frame
                        items:(NSArray *)items
               cellIdentifier:(NSString *)cellIdentifier
                     cellType:(kFYCellType)cellType;

@end
