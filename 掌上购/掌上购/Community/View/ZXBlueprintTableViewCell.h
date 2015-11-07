//
//  ZXBlueprintTableViewCell.h
//  掌上购
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXBlueprintTableViewCell : UITableViewCell
@property(nonatomic,strong) UILabel * titleLbl;
@property(nonatomic,strong) UILabel * kindLbl;
@property(nonatomic,strong) UIImageView * backImageView;
@property(nonatomic,strong) UITextView * contentTextView;
@property(nonatomic,strong) UILabel * likeLbl;
@property(nonatomic,strong) UILabel * timeLbl;
@end
