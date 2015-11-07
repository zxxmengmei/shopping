//
//  ZXBlueprintTableViewCell.m
//  掌上购
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXBlueprintTableViewCell.h"

@implementation ZXBlueprintTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}
-(void) createUI{
    self.titleLbl = [[UILabel alloc] init];
    self.titleLbl.font = [UIFont systemFontOfSize:17];
    [self addSubview:self.titleLbl];
    
    self.kindLbl = [[UILabel alloc] init];
    self.kindLbl.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.kindLbl];
    
    self.backImageView = [[UIImageView alloc] init];
    [self addSubview:self.backImageView];
    
    self.contentTextView = [[UITextView alloc] init];
    self.contentTextView.editable = NO;
    [self addSubview:self.contentTextView];
    
    self.likeLbl = [[UILabel alloc] init];
    self.likeLbl.font = [UIFont systemFontOfSize:14];
    self.likeLbl.textColor = [UIColor grayColor];
    [self addSubview:self.likeLbl];
    
    self.timeLbl = [[UILabel alloc] init];
    self.timeLbl.font = [UIFont systemFontOfSize:14];
    self.timeLbl.textColor = [UIColor grayColor];
    [self addSubview:self.timeLbl];
    
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(0);
        make.width.equalTo(@200);
        make.height.equalTo(@30);
    }];
    [self.kindLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.right.equalTo(self.mas_right).offset(-10);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(40);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@200);
    }];
    
    [self.contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.backImageView.mas_bottom).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@100);
    }];
    
    [self.likeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.contentTextView.mas_bottom).offset(10);
        make.width.equalTo(@80);
        make.height.equalTo(@20);
    }];
    [self.timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentTextView.mas_bottom).offset(10);
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
