//
//  ZXMakeUpTableViewCell.h
//  掌上购
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXMakeUpTableViewCell : UITableViewCell
@property(nonatomic,strong) UILabel * titleLbl;
@property(nonatomic,strong) UILabel * detailLbl;
@property(nonatomic,strong) UIImageView * leftImageView;
@property(nonatomic,strong) UIImageView * middleImageView;
@property(nonatomic,strong) UIImageView * rightImageView;
@property(nonatomic,strong) UILabel * timeLbl;
@property(nonatomic,strong) UILabel * authorLbl;
@property(nonatomic,strong) UILabel * likeLbl;
@end
