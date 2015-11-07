//
//  ZXHomeView.m
//  掌上购
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXHomeView.h"
#import "url.h"
#import "UIImageView+WebCache.h"
#import "ZXHomeViewController.h"
#import "ZXSpDetailViewController.h"

@implementation ZXHomeView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //请求数据
        ZXRequestModel * model = [[ZXRequestModel alloc] init];
        model.path = SPECIAL_URL;
        model.delegate = self;
        [model startRequestInfo];
        
    }
    return self;
}
-(void)sendMessage:(NSData *)data andPath:(NSString *)path{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary * dict = dic[@"data"];
    NSArray * array = dict[@"ad"];
    self.adData = [[NSMutableArray alloc] init];
    [self.adData addObjectsFromArray:array];
    [self createUI];
}
-(void)createUI{
    self.imageView1 = [[UIImageView alloc] init];
    [self.imageView1 setImageWithURL:[NSURL URLWithString:self.adData[0][@"img"]]];
    self.imageView1.tag = 1;
    self.imageView1.userInteractionEnabled = YES;
    [self addSubview:self.imageView1];
    
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap1.numberOfTapsRequired = 1;
    tap1.numberOfTouchesRequired = 1;
    [self.imageView1 addGestureRecognizer:tap1];
    
    
    self.imageView2 = [[UIImageView alloc] init];
    [self.imageView2 setImageWithURL:[NSURL URLWithString:self.adData[1][@"img"]]];
    self.imageView2.tag = 2;
    self.imageView2.userInteractionEnabled = YES;
    [self addSubview:self.imageView2];
    
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap2.numberOfTapsRequired = 1;
    tap2.numberOfTouchesRequired = 1;
    [self.imageView2 addGestureRecognizer:tap2];
    
    
    self.imageView3 = [[UIImageView alloc] init];
    [self.imageView3 setImageWithURL:[NSURL URLWithString:self.adData[2][@"img"]]];
    self.imageView3.tag = 3;
    self.imageView3.userInteractionEnabled = YES;
    [self addSubview:self.imageView3];
    
    UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap3.numberOfTapsRequired = 1;
    tap3.numberOfTouchesRequired = 1;
    [self.imageView3 addGestureRecognizer:tap3];
    
    self.imageView4 = [[UIImageView alloc] init];
    [self.imageView4 setImageWithURL:[NSURL URLWithString:self.adData[3][@"img"]]];
    self.imageView4.tag = 4;
    self.imageView4.userInteractionEnabled = YES;
    [self addSubview:self.imageView4];
    
    UITapGestureRecognizer * tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap4.numberOfTapsRequired = 1;
    tap4.numberOfTouchesRequired = 1;
    [self.imageView4 addGestureRecognizer:tap4];
    
    [self.imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(0);
        make.right.equalTo(self.imageView2.mas_left).offset(-10);
        make.height.equalTo(@100);
        make.width.equalTo(@[self.imageView2.mas_width,self.imageView3.mas_width,self.imageView4.mas_width]);
    }];
    
    [self.imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.right.equalTo(self.imageView3.mas_left).offset(-10);
        make.height.equalTo(@100);
    }];
    
    [self.imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.right.equalTo(self.imageView4.mas_left).offset(-10);
        make.height.equalTo(@100);
    }];
    
    [self.imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@100);
    }];
    
    
}
-(void)tapAction:(UITapGestureRecognizer*)tap{
    if (self.pushToNextVC) {
        self.pushToNextVC();
    }
}
@end
