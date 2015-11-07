//
//  ZXSettingViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXSettingViewController.h"
#import "ZXSettingView.h"
#import "ZXMyViewController.h"

@interface ZXSettingViewController ()

@end

@implementation ZXSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"设置";
   self.view.backgroundColor = [UIColor cyanColor];
    ZXSettingView * setView = [[ZXSettingView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //设置block
    __weak typeof (self) weakSelf = self;
    [setView setPushToMyVC:^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    [setView setSend:^(NSInteger a) {
        if (a == 4) {
            UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:@"标题" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle: @"destruction"otherButtonTitles:@"想一想",@"等一等",@"清除", nil];
            sheet.actionSheetStyle = UIActionSheetStyleAutomatic;
            [sheet showInView:weakSelf.view];
            
        }
        else if (a == 5){
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"您已经是最新版本了😊" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }
    }];
    [self.view addSubview:setView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
