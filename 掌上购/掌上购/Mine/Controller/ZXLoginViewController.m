//
//  ZXQuitViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXLoginViewController.h"


@interface ZXLoginViewController ()

@end

@implementation ZXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"第三方登录";
//    self.view.backgroundColor = [UIColor cyanColor];
//    ZXQuitView * quitView = [[ZXQuitView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addSubview:quitView];
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURL * url = [NSURL URLWithString:DENGLU_URL];
    [web loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:web];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
