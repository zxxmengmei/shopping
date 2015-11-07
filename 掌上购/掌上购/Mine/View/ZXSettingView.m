//
//  ZXSettingView.m
//  掌上购
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXSettingView.h"

@implementation ZXSettingView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createBtn];
        [self createQuitBtn];
    }
    
    return self;
}
-(void)createBtn{
    NSArray * array = @[@"清除缓存",@"关于掌上购物"];
    for (int i=0; i<array.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 66+30*i, self.frame.size.width, 30);
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i+4;
        [self addSubview:btn];
    }
}
-(void)pressBtn:(UIButton*)sender{
    UIButton * btn = (UIButton*)sender;
    if (btn.tag == 4) {
        if (self.send) {
            self.send(4);
        }
    }
    else if (btn.tag == 5){
        if (self.send) {
            self.send(5);
        }
    }
}
-(void)createQuitBtn{
    self.quitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.quitBtn setTitle:@"返回" forState:UIControlStateNormal];
    [self.quitBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.quitBtn addTarget:self action:@selector(quit:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.quitBtn];
    [self.quitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(100);
        make.right.equalTo(self.mas_right).offset(-100);
        make.bottom.equalTo(self.mas_bottom).offset(-100);
        make.height.equalTo(@30);
    }];
}
-(void)quit:(id)sender{
    if (self.pushToMyVC) {
        self.pushToMyVC();
    }
}
@end
