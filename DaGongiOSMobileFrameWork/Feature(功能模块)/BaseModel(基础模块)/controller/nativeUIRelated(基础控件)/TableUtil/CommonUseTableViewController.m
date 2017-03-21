//
//  CommonUseTableViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/8.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "CommonUseTableViewController.h"

@interface CommonUseTableViewController ()
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation CommonUseTableViewController

- (void)viewDidAppear:(BOOL)animated
{
//          ---默认选中某一行---
//    NSIndexPath *path=[NSIndexPath indexPathForItem:0 inSection:0];
//    [self.tableView selectRowAtIndexPath:path animated:YES scrollPosition:UITableViewScrollPositionBottom];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray= [[NSMutableArray alloc]initWithObjects:@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",@"mac",nil];
//          ---简单控制分割线---
//    self.tableView.separatorStyle = NO;
//    self.tableView.separatorColor = [UIColor brownColor];

//          ---去掉多余的分割线---
//    self.tableView.tableFooterView=[[UIView alloc] init]; // hide line
    
//          ---控制表格高度，这种设置方法有助于优化性能---
//    self.tableView.rowHeight = 88;
    
//          ---设置搜索框---
//    [_tableView setTableHeaderView:_searchBar];
   
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}


//为tableView的cell展示添加动画效果
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1. 配置CATransform3D的内容
    CATransform3D transform;
    transform = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    transform.m34 = 1.0/ -600;
    // 2. 定义cell的初始状态
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    cell.layer.transform = transform;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    // 3. 定义cell的最终状态，并提交动画
    [UIView beginAnimations:@"transform" context:NULL];
    [UIView setAnimationDuration:1.5];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView commitAnimations];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text=[self.dataArray objectAtIndex:indexPath.row];
    return cell;

    
    
//            ---更新数据的正确方式---
//    dispatch_async(dispatch_get_main_queue(), ^{
//                self.dataSourceArray= a new Array.//   或删除当前列表的内容，从新加载[self.dataarray   removeAllObjects];
//                     [self.tableView reloadData];
//                     [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic]; //刷新当前行
//    });
    
    
    
//          ---自定义表格行右边的图片---
//    UIButton *actonButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [actonButton setTitle:@"活跃"  forState:UIControlStateNormal];
//    [actonButton setTintColor:[UIColor redColor]];
//    CGRect aframe = CGRectMake(0.0, 0.0, 30, 30);
//    actonButton.frame=aframe;
//    cell.accessoryView=actonButton;

    
//          ---设置UItableview的imageview中image的大小---
//    cell.imageView.image=[UIImage imageNamed:@"灰时间"];
//    //2、调整大小
//    CGSize itemSize = CGSizeMake(40, 40);
//    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
//    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
//    [cell.imageView.image drawInRect:imageRect];
//    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return cell;


//          ---更好的利用重用机制---
//     [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier]
//    这个方法就是重用机制的核心了。比如，有一个界面可显示10个cell，那么创建10次cell，并给cell指定同样的重用标识(当然，可以为不同显示类型的cell指定不同的  标识)并且10个cell将全部都加入到visiableCells数组，reusableTableCells为空.
//    滚动tableView，当有一个cell完全移出屏幕时，这个cell就会被加入到reusableTableCells。而新出现的那个cell将加入到visiableCells，而这个cell就是被重用的。
//    如果要让tableview不重用，不设置reuseIdentifier就可以了。
//    static NSString *CellIdentifier = @"cell1";
//    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil)
//    {
//        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        UILabel *labelTest = [[UILabel alloc]init];
//        [labelTest setFrame:CGRectMake(2, 2, 80, 40)];
//        [labelTest setBackgroundColor: [UIColor clearColor]];
//        [[cell contentView]addSubview:labelTest];
//        [labelTest setText:[self.dataArray objectAtIndex:indexPath.row]];
//    }
//    
//    return cell;

    
//          ---表格开启多选---
//    self.tableView.allowsMultipleSelectionDuringEditing=YES;
//    [self.tableView setEditing:YES]; //////设置uitableview为编译状态
//    //同时还有一个属性保存了你当前选择的indexPath集合
//    NSArray *indexPaths =[self.tableView indexPathsForSelectedRows];
    
    
//          ---设置UItableView的选中背景---
//    UIView *myview = [[UIView alloc] init];
//    myview.frame = CGRectMake(0, 0, 320, 47);
//    myview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1.png"]];
//    cell.selectedBackgroundView = myview;

    
//          ---设置cell的文字、字体、位置、背景色---
//    cell.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
//    // 设置文字的字体
//    cell.textLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:100.0f];
//    // 设置文字的颜色
//    cell.textLabel.textColor = [UIColor orangeColor];
//    // 设置文字的背景颜色
//    cell.textLabel.shadowColor = [UIColor whiteColor];
//    // 设置文字的显示位置
//    cell.textLabel.textAlignment = UITextAlignmentCenter;

    
//          ---表格cell后面的符号---
//    cell.accessoryType = UITableViewCellAccessoryNone;//cell没有任何的样式
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//cell的右边有一个小箭头，距离右边有十几像素；
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;//cell右边有一个蓝色的圆形button；
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;//cell右边的形状是对号；
    

}
@end





//NOTE:
//在一个uiview中添加UItableview
//TODOTableViewController  *todo = [[TODOTableViewController alloc] init];
//todo.view.autoresizingMask = UIViewAutoresizingNone;
//[self addChildViewController:todo];
//todo.view.frame = CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.height);
//[self.view addSubview:todo.view];
//[todo didMoveToParentViewController:self];
//[super viewDidLoad];

//点击行不变色
//cell.selectionStyle = UITableViewCellSelectionStyleNone;


//常用方法
//UItableView
///// tableView 样式
//typedef NS_ENUM(NSInteger, UITableViewStyle) {
//    // 默认不分组样式
//    UITableViewStylePlain,
//    // 分组样式
//    UITableViewStyleGrouped
//};
//
///************************* UITableView : UIScrollView ****************************/
///**
// *  全局刷新(每一行都会重新刷新)
// */
//- (void)reloadData;
//
///**
// *  让 tableView 滚动到指定 indexPath 的位置
// */
//- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
//
///**
// *  在指定 indexPaths 插入单\多行 cell
// */
//- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
//
///**
// *  在指定 indexPaths 删除单\多行 cell
// */
//- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
//
///**
// *  刷新指定 indexPaths 单\多行 cell (使用前提: 刷新前后, 模型数据的个数不变)
// */
//- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);
//
///**
// *  局部删除(使用前提: 模型数据减少的个数 == indexPaths的长度)
// */
//- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
//
//
///********************** UITableViewDataSource<NSObject> **************************/
///**
// *  设置 tableView 的组数，可以不实现 默认是1
// */
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
//
///**
// *  设置 tableView 的行数，必须实现
// */
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
//
///**
// *  设置 tableView 每一行的 cell，必须实现
// */
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
//
///**
// *  组头标题
// */
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
//
///**
// *  组尾标题
// */
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
//
///**
// *  tableView 右侧的索引数组
// */
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView;
//
//
///************ UITableViewDelegate<NSObject, UIScrollViewDelegate> ***********/
///**
// *  tableViewCell 将要显示
// */
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
//
///**
// *  组头视图 将要显示
// */
//- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);
//
///**
// *  组尾视图 将要显示
// */
//- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);
//
///**
// *  tableViewCell 完成显示
// */
//- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0);
//
///**
// *  组头视图 完成显示
// */
//- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);
//
///**
// *  组尾视图 完成显示
// */
//- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);
//
///**
// *  设置 tableView 的行高
// */
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
//
///**
// *  设置 tableView 的组头的高度
// */
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
//
///**
// *  设置 tableView 的组尾的高度
// */
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
//
///**
// *  将要选中 tableView 的某行
// */
//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
//
///**
// *  将要取消选中 tableView 的某行
// */
//- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);
//
///**
// *  完成选中了 tableView 的某行
// */
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
//
///**
// *  完成取消选中 tableView 的某行
// */
//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);


