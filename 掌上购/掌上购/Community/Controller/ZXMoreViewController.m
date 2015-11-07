//
//  ZXMoreViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXMoreViewController.h"

@interface ZXMoreViewController ()

@end

@implementation ZXMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURL * url = [NSURL URLWithString:@"http://js.imglefeng.com/js/wap/html/20150127/html/video_list.html"];
    [web loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self.view addSubview:web];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
