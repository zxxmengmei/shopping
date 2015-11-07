//
//  ZXMyView.m
//  掌上购
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXMyView.h"


@interface ZXMyView()

@end

@implementation ZXMyView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
        [self createChooseBtn];
    }
    return self;
}
-(void)createUI{
    //头像
    self.headImageView = [[UIImageView alloc] init];
   self.headImageView.image = [UIImage imageNamed:@"1613343300-2"];
    self.headImageView.userInteractionEnabled = YES;
    [self addSubview:self.headImageView];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(74);
        make.width.equalTo(@100);
        make.height.equalTo(@100);
    }];
    
    
    
    //用户名
    self.nameLbl = [[UILabel alloc] init];
    self.nameLbl.textAlignment = NSTextAlignmentCenter;
    self.nameLbl.font = [UIFont systemFontOfSize:24];
    [self addSubview:self.nameLbl];
    [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(170);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    //收藏button
    self.collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.collectionBtn setTitle:@"收藏夹" forState:UIControlStateNormal];
    [self.collectionBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.collectionBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.collectionBtn.tag = 100;
    [self addSubview:self.collectionBtn];
    
    //购物车button
    self.buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buyBtn setTitle:@"购物车" forState:UIControlStateNormal];
    [self.buyBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.buyBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.buyBtn.tag = 200;
    [self addSubview:self.buyBtn];
    
    //订单button
    self.orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.orderBtn setTitle:@"订单" forState:UIControlStateNormal];
    [self.orderBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.orderBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.orderBtn.tag = 300;
    [self addSubview:self.orderBtn];
    
    [self.collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(220);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    [self.buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.collectionBtn.mas_bottom).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    
    [self.orderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.buyBtn.mas_bottom).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
}

-(void)createChooseBtn{
    self.chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.chooseBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.chooseBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.chooseBtn addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.chooseBtn];
    [self.chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(100);
        make.right.equalTo(self.mas_right).offset(-100);
        make.bottom.equalTo(self.mas_bottom).offset(-100);
        make.height.equalTo(@30);
    }];
}
-(void)choose:(id)sender{
    if (self.pushToLRVC) {
        self.pushToLRVC();
    }
}
-(void)pressBtn:(UIButton*)sender{
    UIButton * btn = (UIButton*)sender;
    if (btn.tag == 100) {
        if (self.send) {
            self.send(100);
        }
    }
    else if (btn.tag == 200){
        if (self.send) {
            self.send(200);
        }
    }
    else if (btn.tag == 300){
        if (self.send) {
            self.send(300);
        }
    }
}
@end
