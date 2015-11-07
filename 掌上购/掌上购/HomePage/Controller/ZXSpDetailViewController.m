//
//  ZXSpDetailViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXSpDetailViewController.h"

@interface ZXSpDetailViewController ()

@end

@implementation ZXSpDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"详情";
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURL * url = [NSURL URLWithString:@"http://s.gou.gionee.com/click/redirect?t=2936969018"];
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
