//
//  ZXGoodShopViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXGoodShopViewController.h"

@interface ZXGoodShopViewController ()

@end

@implementation ZXGoodShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"好店";
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURL * url = [NSURL URLWithString:string];
    [web loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self.view addSubview:web];
}

@end
