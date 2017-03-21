//
//  GwbTableDataSource.h
//  LightTableViewDemo
//
//  Created by mac on 16/5/26.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, kFYCellType){
    kFYCellTypeDefault = 0,
};

@protocol GwbTableDataSourceDelegate <NSObject>

@optional
- (void)didSelectedCellWithItem:(id)item tableView:(UITableView *)tableView;

- (CGFloat)heightForHeaderInSection:(NSInteger)section tableView:(UITableView *)tableView;

- (UIView *)viewForHeaderInSection:(NSInteger)section tableView:(UITableView *)tableView;

- (CGFloat)heightForFooterInSection:(NSInteger)section tableView:(UITableView *)tableView;

- (UIView *)viewForFooterInSection:(NSInteger)section tableView:(UITableView *)tableView;

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView;

@end


@interface GwbTableDataSource :NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)       NSArray *items;

@property (nonatomic, assign)       id<GwbTableDataSourceDelegate>  delegate;

- (instancetype)initWithItems:(NSMutableArray  *)items cellIdentifier:(NSString *)cellIdentifier cellType:(kFYCellType)cellType;
@end
