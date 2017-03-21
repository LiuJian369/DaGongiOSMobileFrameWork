//
//  EditViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/24.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "EditViewController.h"
#import "Student.h"
#import "DataBaseTool.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *ageLabel;
@property (weak, nonatomic) IBOutlet UITextField *scoreLabel;
@property (weak, nonatomic) IBOutlet UITextField *sexLabel;
@end

@implementation EditViewController
- (IBAction)Sure:(id)sender {
    if (self.student) {
        Student *stu = [[Student alloc]init];
        stu.name = self.nameLabel.text;
        stu.sex = self.sexLabel.text;
        stu.score = [self.scoreLabel.text floatValue];
        stu.age = [self.ageLabel.text integerValue];
        stu.ID = self.student.ID;
        BOOL response = [[DataBaseTool shareData] updateStudent:stu];
        if (response) {
            _passStu(stu);
            [self dismissViewControllerAnimated:YES completion:nil];
        }else {
            NSLog(@"error");
        }
    }else {
        Student *stu = [[Student alloc]init];
        stu.name = self.nameLabel.text;
        stu.sex = self.sexLabel.text;
        stu.score = [self.scoreLabel.text floatValue];
        stu.age = [self.ageLabel.text integerValue];
        if (stu.name&&stu.sex&&stu.score&&stu.age) {
            BOOL response = [[DataBaseTool shareData] addStudent:stu];
            if (response) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }else {
                NSLog(@"error");
            }
        }else {
            NSLog(@"没有填数据");
        }
    }
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.student) {
        [self loadData];
    }
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (void)loadData
{
    self.nameLabel.text = self.student.name;
    self.sexLabel.text = self.student.sex;
    self.ageLabel.text = [NSString stringWithFormat:@"%ld",self.student.age];
    self.scoreLabel.text = [NSString stringWithFormat:@"%.2f",self.student.score];
    
    
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
