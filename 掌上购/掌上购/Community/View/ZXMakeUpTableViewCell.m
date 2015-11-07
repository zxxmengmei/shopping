//
//  ZXMakeUpTableViewCell.m
//  掌上购
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXMakeUpTableViewCell.h"

@implementation ZXMakeUpTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    self.titleLbl = [[UILabel alloc] init];
    self.titleLbl.font = [UIFont systemFontOfSize:17];
    [self addSubview:self.titleLbl];
    
    self.detailLbl = [[UILabel alloc] init];
    self.detailLbl.textColor = [UIColor grayColor];
    self.detailLbl.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.detailLbl];
    
    self.leftImageView = [[UIImageView alloc] init];
    [self addSubview:self.leftImageView];
    
    self.middleImageView = [[UIImageView alloc] init];
    [self addSubview:self.middleImageView];
    
    self.rightImageView = [[UIImageView alloc] init];
    [self addSubview:self.rightImageView];
    
    self.timeLbl = [[UILabel alloc] init];
    self.timeLbl.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.timeLbl];
    
    self.authorLbl = [[UILabel alloc] init];
    self.authorLbl.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.authorLbl];
    
    self.likeLbl = [[UILabel alloc] init];
    self.likeLbl.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.likeLbl];
    
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(0);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@30);
    }];
    [self.detailLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.titleLbl.mas_bottom).offset(5);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@20);
    }];
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.detailLbl.mas_bottom).offset(10);
        make.right.equalTo(self.middleImageView.mas_left).offset(-10);
        make.height.equalTo(@80);
        make.width.equalTo(@[self.middleImageView,self.rightImageView]);
    }];
    [self.middleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLbl.mas_bottom).offset(10);
        make.right.equalTo(self.rightImageView.mas_left).offset(-10);
        make.height.equalTo(@80);
    }];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLbl.mas_bottom).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@80);
    }];
    
    [self.timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.leftImageView.mas_bottom).offset(10);
        make.right.equalTo(self.authorLbl.mas_left).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@20);
    }];
    [self.authorLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleImageView.mas_bottom).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@20);
    }];
    [self.likeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rightImageView.mas_bottom).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.width.equalTo(@50);
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
