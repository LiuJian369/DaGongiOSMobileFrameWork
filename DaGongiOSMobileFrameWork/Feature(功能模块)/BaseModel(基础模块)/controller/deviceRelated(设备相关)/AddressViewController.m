//
//  AddressViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/5/31.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "AddressViewController.h"
#import "GwbButton.h"
#import "CommonConfig.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface AddressViewController () <ABNewPersonViewControllerDelegate,ABPeoplePickerNavigationControllerDelegate>

@end

@implementation AddressViewController

-(void)viewDidLoad{
    [self setUpUI];
}

-(void) setUpUI{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH/2-50, 100, 100, 100) title:@"添加联系人" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        ABNewPersonViewController *newPersonView = [[ABNewPersonViewController alloc] init];
        newPersonView.newPersonViewDelegate = self;
        UINavigationController *newNavigationController = [[UINavigationController alloc]initWithRootViewController:newPersonView];
        [self presentViewController:newNavigationController animated:YES completion:nil];
    
    }];
    [self.view addSubview:btn];
    
    GwbButton *btn2=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH/2-50, 300, 100, 100) title:@"显示全部联系人" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        ABPeoplePickerNavigationController *picker =[[ABPeoplePickerNavigationController alloc] init];
        picker.peoplePickerDelegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }];
    [self.view addSubview:btn2];
}

#pragma -ABNewPersondelegate
- (void) newPersonViewController:(ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(ABRecordRef)person
{
    [newPersonView dismissViewControllerAnimated:NO completion:nil];
}

@end
