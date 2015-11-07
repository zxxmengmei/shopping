//
//  ZXServeViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXServeViewController.h"

@interface ZXServeViewController ()

@end

@implementation ZXServeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"特价";
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURL * url = [NSURL URLWithString:string];
    [web loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self.view addSubview:web];
}



@end
