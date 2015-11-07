//
//  ZXHomeView.h
//  掌上购
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXRequestModel.h"

@interface ZXHomeView : UIView<sendInfo>
@property(nonatomic,retain) NSMutableArray * adData;

@property(nonatomic,retain) UIImageView * imageView1;
@property(nonatomic,retain) UIImageView * imageView2;
@property(nonatomic,retain) UIImageView * imageView3;
@property(nonatomic,retain) UIImageView * imageView4;
@property(nonatomic,copy) void (^pushToNextVC)(void);
@end
