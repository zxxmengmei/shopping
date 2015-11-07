//
//  ZXStoryTableViewCell.m
//  掌上购
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXStoryTableViewCell.h"

@implementation ZXStoryTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}
-(void) createUI{
    self.titleLbl = [[UILabel alloc] init];
    self.titleLbl.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.titleLbl];

    self.sourceLbl = [[UILabel alloc] init];
    self.sourceLbl.font = [UIFont systemFontOfSize:14];
    self.sourceLbl.textColor = [UIColor grayColor];
    [self addSubview:self.sourceLbl];
    
    self.backImageView = [[UIImageView alloc] init];
    [self addSubview:self.backImageView];
    
    self.timeLbl = [[UILabel alloc] init];
    self.timeLbl.font = [UIFont systemFontOfSize:14];
    self.timeLbl.textColor = [UIColor grayColor];
    [self addSubview:self.timeLbl];
    
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(0);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@30);
    }];
    [self.sourceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.titleLbl.mas_bottom).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@20);
    }];
   
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(70);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@200);
    }];
    
    [self.timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(280);
        make.right.equalTo(self.mas_right).offset(-10);
        make.width.equalTo(@150);
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
