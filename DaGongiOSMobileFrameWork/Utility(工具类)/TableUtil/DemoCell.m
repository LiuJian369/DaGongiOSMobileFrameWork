//
//  DemoCell.m
//  lighterDemo
//
//  Created by apple on 15/11/26.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "DemoCell.h"

@implementation DemoCell

- (void)configureCellContentWithItem:(id)item{
    self.textLabel.text = item;
}

-(void) didSelectedWithItem:(id)item{

}

@end
