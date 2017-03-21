//
//  PickerViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/26.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "PickerViewController.h"
#import "Flag.h"
#import "FlagView.h"

@interface PickerViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic,strong) NSArray *countries;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerView.dataSource=self;
    self.pickerView.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)countries{
    if(nil==_countries){
        NSArray *dictArray =[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MemoEventRank.plist" ofType:nil]];
        NSMutableArray *mCountriesArray =[NSMutableArray array];
        for(NSDictionary *dict in dictArray){
            Flag *flag = [Flag flagWithDictionary:dict];
            [mCountriesArray addObject:flag];
        }
        _countries = mCountriesArray;
    }
    NSLog(@"aaaaa%@",_countries);
    return _countries;
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return  1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.countries.count;
}

-(UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    FlagView *flagView  = [FlagView flagViewWithPickerView:self.pickerView];
    flagView.flag =self.countries[row];
    return  flagView;
}

-(CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return [FlagView flagViewHeight];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
