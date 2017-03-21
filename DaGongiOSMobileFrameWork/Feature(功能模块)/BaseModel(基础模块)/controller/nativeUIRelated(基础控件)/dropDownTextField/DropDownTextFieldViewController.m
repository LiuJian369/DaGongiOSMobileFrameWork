//
//  DropDownTextFieldViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "DropDownTextFieldViewController.h"
#import "IQDropDownTextField.h"

@interface DropDownTextFieldViewController ()<IQDropDownTextFieldDelegate>
@property (nonatomic, strong)IQDropDownTextField *textFieldTextPicker;

@end

@implementation DropDownTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIToolbar *toolbar = [[UIToolbar alloc] init];
//    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
//    [toolbar sizeToFit];
//    UIBarButtonItem *buttonflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    UIBarButtonItem *buttonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClicked:)];
//    [toolbar setItems:[NSArray arrayWithObjects:buttonflexible,buttonDone, nil]];
//    self.textFieldTextPicker.inputAccessoryView = toolbar;
//    self.textFieldTextPicker.dropDownMode=IQDropDownModeTextPicker;
    
UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];

// 设置style
[topView setBarStyle:UIBarStyleBlack];

// 定义两个flexibleSpace的button，放在toolBar上，这样完成按钮就会在最右边
UIBarButtonItem * button1 =[[UIBarButtonItem  alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                            
                                                                         target:self action:nil];

UIBarButtonItem * button2 = [[UIBarButtonItem  alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                             
                                                                          target:self action:nil];

// 定义完成按钮
UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone
                                
                                                              target:self action:@selector(resignKeyboard)];

// 在toolBar上加上这些按钮
NSArray * buttonsArray = [NSArray arrayWithObjects:button1,button2,doneButton,nil];    
[topView setItems:buttonsArray];

 [self.textFieldTextPicker setInputAccessoryView:topView];
    self.textFieldTextPicker = [[IQDropDownTextField alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.textFieldTextPicker.isOptionalDropDown = NO;
    [self.textFieldTextPicker setItemList:[NSArray arrayWithObjects:@"London",@"Johannesburg",@"Moscow",@"Mumbai",@"Tokyo",@"Sydney", nil]];
    [self.view addSubview:self.textFieldTextPicker];
    
}


-(void)textField:(nonnull IQDropDownTextField*)textField didSelectItem:(nullable NSString*)item
{
    NSLog(@"%@: %@",NSStringFromSelector(_cmd),item);
}

-(void)textField:(IQDropDownTextField *)textField didSelectDate:(NSDate *)date
{
    NSLog(@"%@: %@",NSStringFromSelector(_cmd),date);
}

-(BOOL)textField:(nonnull IQDropDownTextField*)textField canSelectItem:(nullable NSString*)item
{
    NSLog(@"%@: %@",NSStringFromSelector(_cmd),item);
    return YES;
}

-(IQProposedSelection)textField:(nonnull IQDropDownTextField*)textField proposedSelectionModeForItem:(nullable NSString*)item
{
    NSLog(@"%@: %@",NSStringFromSelector(_cmd),item);
    return IQProposedSelectionBoth;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

-(void)doneClicked:(UIBarButtonItem*)button
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
