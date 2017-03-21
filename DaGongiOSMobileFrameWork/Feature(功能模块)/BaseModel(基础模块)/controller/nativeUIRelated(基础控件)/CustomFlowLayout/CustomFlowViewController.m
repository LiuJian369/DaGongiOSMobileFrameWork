//
//  CustomFlowViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by 刘建 on 16/11/4.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "CustomFlowViewController.h"
#import "CustomCollectionViewFlowLayout.h"
#import "CollectionViewCell.h"
@interface CustomFlowViewController ()<UICollectionViewDataSource,CustomCollectionViewFlowLayoutDelegate,UICollectionViewDelegate>
@property(nonatomic,retain)UICollectionView * collectView;

@end

@implementation CustomFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomCollectionViewFlowLayout * customLayout = [[CustomCollectionViewFlowLayout alloc] init];
    customLayout.columnCount = 2;
    customLayout.delegate = self;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:customLayout];
    [self.view addSubview:collectionView];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];

    self.collectView = collectionView;


    [self.collectView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 199;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    UILabel * label = (UILabel *)[cell viewWithTag:888];
    if (!label) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        label.tag = 888;
        [cell addSubview:label];
    }
    label.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

- (CGSize)sizeForItemWithIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, (arc4random() % 100)+ 100);
}


@end
