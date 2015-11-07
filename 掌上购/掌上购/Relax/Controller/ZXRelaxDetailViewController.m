//
//  ZXRelaxDetailViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXRelaxDetailViewController.h"

@interface ZXRelaxDetailViewController ()

@end

@implementation ZXRelaxDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"详情";
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURL * url = [NSURL URLWithString:self.urlString];
    [web loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self.view addSubview:web];
    
}


@end
