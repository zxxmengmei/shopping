//
//  ZXSettingView.h
//  掌上购
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXSettingView : UIView
@property(nonatomic,retain) UIView * setView;
@property(nonatomic,retain) UIButton * registerBtn;
@property(nonatomic,retain) UIButton * quitBtn;

@property(nonatomic,copy) void (^pushToMyVC)(void);
@property(nonatomic,copy) void (^send)(NSInteger a);

@end
