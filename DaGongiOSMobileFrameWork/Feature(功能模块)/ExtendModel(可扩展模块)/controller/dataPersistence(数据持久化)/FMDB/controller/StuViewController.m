//
//  StuViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/24.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "StuViewController.h"
#import "EditViewController.h"

@interface StuViewController ()
@property (weak, nonatomic) IBOutlet UITextField *IDLabel;
@property (weak, nonatomic) IBOutlet UITextField *NameLabel;
@property (weak, nonatomic) IBOutlet UITextField *SexLabel;
@property (weak, nonatomic) IBOutlet UITextField *AgeLabel;
@property (weak, nonatomic) IBOutlet UITextField *ScoreLabel;

@end

@implementation StuViewController
- (IBAction)Edit:(id)sender {
    EditViewController *editView =[[EditViewController alloc] init];
    editView.student=self.student;
    editView.passStu = ^(Student *student){
        self.student = student;
    };
    [self presentViewController:editView animated:YES completion:nil];
    
}
- (IBAction)End:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadData];
}

- (void)loadData
{
    self.IDLabel.text = [NSString stringWithFormat:@"%ld",(long)self.student.ID];
    self.NameLabel.text = self.student.name;
    self.SexLabel.text = self.student.sex;
    self.AgeLabel.text = [NSString stringWithFormat:@"%ld",self.student.age];
    self.ScoreLabel.text = [NSString stringWithFormat:@"%.2f",self.student.score];
    
    
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
