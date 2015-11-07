//
//  ZXMyView.h
//  掌上购
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXMyView : UIView
@property(nonatomic,retain) UIImageView * headImageView;
@property(nonatomic,retain) UILabel * nameLbl;
@property(nonatomic,retain) UIButton * collectionBtn;
@property(nonatomic,retain) UIButton * buyBtn;
@property(nonatomic,retain) UIButton * orderBtn;
@property(nonatomic,retain) UIButton * chooseBtn;

//跳到登录注册界面的block
@property(nonatomic,copy) void (^pushToLRVC)(void);
@property(nonatomic,copy) void (^send)(NSInteger a);
@property(nonatomic,copy) void (^save)(UIImage * myImage);
@end
