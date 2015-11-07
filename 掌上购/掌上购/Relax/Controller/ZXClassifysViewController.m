//
//  ZXClassifysViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXClassifysViewController.h"

@interface ZXClassifysViewController ()

@end

@implementation ZXClassifysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-40, self.view.frame.size.height)];
    NSString * string = @"http://s.gou.gionee.com/click/redirect?t=3224597257";
    NSURL * url = [NSURL URLWithString:string];
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
