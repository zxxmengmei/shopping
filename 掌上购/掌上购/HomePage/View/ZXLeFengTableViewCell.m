//
//  ZXLeFengTableViewCell.m
//  掌上购
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXLeFengTableViewCell.h"

@implementation ZXLeFengTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    self.headImageView = [[UIImageView alloc] init];
    [self addSubview:self.headImageView];
    
    self.nameTextView = [[UITextView alloc] init];
    [self.nameTextView setEditable:NO];
    self.nameTextView.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.nameTextView];
    
    self.currentPriceLbl = [[UILabel alloc] init];
    self.currentPriceLbl.textColor = [UIColor redColor];
    [self addSubview:self.currentPriceLbl];
    
    self.originalPriceLbl = [[UILabel alloc] init];
    self.originalPriceLbl.textColor = [UIColor lightGrayColor];
    self.originalPriceLbl.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.originalPriceLbl];
    
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self.originalPriceLbl addSubview:self.lineView];
    
    self.discountLbl = [[UILabel alloc] init];
    self.discountLbl.textColor = [UIColor blueColor];
    [self addSubview:self.discountLbl];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.width.equalTo(@120);
        make.height.equalTo(@120);
    }];
    
    [self.nameTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.top.equalTo(self.mas_top).offset(0);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@60);
    }];
    
    [self.currentPriceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.top.equalTo(self.nameTextView.mas_bottom).offset(10);
        make.width.equalTo(@70);
        make.height.equalTo(@20);
    }];
    
    [self.originalPriceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.currentPriceLbl.mas_right).offset(5);
        make.top.equalTo(self.nameTextView.mas_bottom).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@15);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.originalPriceLbl.mas_left).offset(0);
        make.top.equalTo(self.originalPriceLbl.mas_top).offset(7);
        make.right.equalTo(self.originalPriceLbl.mas_right).offset(0);
        make.height.equalTo(@1);
    }];
    
    [self.discountLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.top.equalTo(self.currentPriceLbl.mas_bottom).offset(10);
        make.width.equalTo(@60);
        make.height.equalTo(@20);
    }];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
