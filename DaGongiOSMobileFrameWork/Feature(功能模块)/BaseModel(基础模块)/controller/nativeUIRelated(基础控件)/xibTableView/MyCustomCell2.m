//
//  MyCustomCell2.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/8/18.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "MyCustomCell2.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"

@interface MyCustomCell2()

@end

@implementation MyCustomCell2

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    _hotelNameText= [[UILabel alloc]init];
    _hotelNameText.textColor = [UIColor blackColor];
    _hotelNameText.textAlignment =  NSTextAlignmentLeft;
    _hotelNameText.font = [UIFont systemFontOfSize:18];
//    _hotelNameText.backgroundColor=[UIColor redColor];
    
    _hotelIcon = [[UIImageView alloc]init];
//    _hotelIcon.layer.cornerRadius  = 55 / 2.0; //图片宽度的一般
    _hotelIcon.layer.masksToBounds = YES;
    
    _frText = [[UILabel alloc]init];
    _frText.textColor  = [UIColor grayColor];
    _frText.textAlignment =  NSTextAlignmentLeft;
    _frText.font = [UIFont systemFontOfSize:12];
    _frText.backgroundColor=[UIColor clearColor];
    
    _frContent  = [[UILabel alloc]init];
    _frContent.font  = [UIFont systemFontOfSize:12];
    _frContent.textAlignment  =  NSTextAlignmentLeft;
    _frContent.textColor  = [UIColor grayColor];
//    _frContent.numberOfLines  = 0;
    
    _jynxText = [[UILabel alloc]init];
    _jynxText.font = [UIFont systemFontOfSize:12];
    _jynxText.textColor  = [UIColor grayColor];
    _jynxText.textAlignment =  NSTextAlignmentLeft;
//    _jynxText.backgroundColor=[UIColor redColor];
    
    _jynxContent = [[UILabel alloc]init];
    _jynxContent.font = [UIFont systemFontOfSize:12];
    _jynxContent.textColor  = [UIColor grayColor];
    _jynxContent.textAlignment =  NSTextAlignmentLeft;
    
    _dzText = [[UILabel alloc]init];
    _dzText.font = [UIFont systemFontOfSize:12];
    _dzText.textColor  = [UIColor grayColor];
    _dzText.textAlignment =  NSTextAlignmentLeft;
    
    
    _dzContent = [[UILabel alloc]init];
    _dzContent.font = [UIFont systemFontOfSize:12];
    _dzContent.textColor  = [UIColor grayColor];
    _dzContent.textAlignment =  NSTextAlignmentLeft;
    
    _hotelFX = [[UIImageView alloc]init];
//    _hotelFX.layer.cornerRadius  = 55 / 2.0; //图片宽度的一般
    _hotelFX.layer.masksToBounds = YES;
    
  
    [self.contentView  addSubview: _hotelNameText];
    [self.contentView  addSubview: _hotelIcon];
    [self.contentView  addSubview: _frText];
    [self.contentView  addSubview: _frContent];
    [self.contentView  addSubview: _jynxText];
    [self.contentView  addSubview: _jynxContent];
    [self.contentView  addSubview: _dzText];
    [self.contentView  addSubview: _dzContent];
    [self.contentView  addSubview: _hotelFX];
    
    [_hotelIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(7);
        make.left.equalTo(self.contentView.mas_left).offset(17);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    
    
    [_hotelNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(_hotelIcon.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(150, 18));
    }];
    

    [_frText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_hotelIcon.mas_bottom).offset(8);
        make.left.equalTo(self.contentView.mas_left).offset(17);
        make.size.mas_equalTo(CGSizeMake(30, 12));
    }];
    
    
    [_frContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_hotelIcon.mas_bottom).offset(8);
        make.left.equalTo(_frText.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(25, 12));
    }];

    
    [_jynxText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_frContent.mas_bottom).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(17);
        make.size.mas_equalTo(CGSizeMake(55, 12));
    }];


    [_jynxContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_frContent.mas_bottom).offset(5);
        make.left.equalTo(_jynxText.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(25, 12));
    }];
    
    
    [_dzText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_jynxContent.mas_bottom).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(17);
        make.size.mas_equalTo(CGSizeMake(30, 12));
    }];
    
    
    [_dzContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_jynxContent.mas_bottom).offset(5);
        make.left.equalTo(_dzText.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(225, 12));
    }];



    [_hotelFX mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.contentView.mas_top).offset(9);
         make.right.equalTo(self.contentView.mas_right).offset(-35);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
//
//    _userHeaderImage.userInteractionEnabled = YES;
//    UITapGestureRecognizer *headerImageTap  =
//    [[UITapGestureRecognizer alloc]initWithTarget: self action: @selector(headerImageTapAction)];
//    [_userHeaderImage addGestureRecognizer:headerImageTap];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
