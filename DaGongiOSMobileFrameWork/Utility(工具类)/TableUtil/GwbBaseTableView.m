//
//  GwbBaseTableView.m
//  LightTableViewDemo
//
//  Created by mac on 16/5/26.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "GwbBaseTableView.h"

@interface GwbBaseTableView ()

@property (nonatomic, strong) GwbTableDataSource *defaultDataSource;

@end

@implementation GwbBaseTableView

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier cellType:(kFYCellType)cellType{
    self = [super initWithFrame:frame];
    if (self) {
        self.defaultDataSource = [[GwbTableDataSource alloc] initWithItems:items cellIdentifier:cellIdentifier cellType:cellType];
        self.dataSource = _defaultDataSource;
    }
    return self;
}

@end
