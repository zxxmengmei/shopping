//
//  ZXLeFengTableViewCell.h
//  掌上购
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXLeFengTableViewCell : UITableViewCell
@property(nonatomic,strong) UIImageView * headImageView;
@property(nonatomic,strong) UITextView * nameTextView;
@property(nonatomic,strong) UILabel * currentPriceLbl;
@property(nonatomic,strong) UILabel * originalPriceLbl;
@property(nonatomic,strong) UIView * lineView;
@property(nonatomic,strong) UILabel * discountLbl;
@end
