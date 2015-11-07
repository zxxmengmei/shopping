//
//  ZXLeftViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXLeftViewController.h"
#import "ZXLeftView.h"
#import "ZXClassifysViewController.h"
#import "ZXServeViewController.h"
#import "ZXGoodShopViewController.h"

@interface ZXLeftViewController ()
{
    NSTimer * timer1;
    int sum;
}
@end

@implementation ZXLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView * backImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backImageView.backgroundColor = [UIColor cyanColor];
    backImageView.tag = 999;
    [self.view addSubview:backImageView];
    
    UIView * v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 66, self.view.frame.size.width-100, 150)];
    
    UIDatePicker *date=[[UIDatePicker alloc] init];
    date.timeZone=[NSTimeZone timeZoneWithName:@"Asia/beijing"];
    date.backgroundColor=[UIColor redColor];
    [v1 addSubview:date];
    [backImageView addSubview:v1];
 
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 400, 300, 30)];
    label.tag = 1000;
    [backImageView addSubview:label];
    
    
    

    timer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(sum) userInfo:nil repeats:YES];
    sum=0;
    
}
-(void)sum{
    sum++;
    UILabel * label = (UILabel*)[self.view viewWithTag:1000];
    int hour,min,sec;
    hour = sum/3600;
    min = (sum-hour*3600)/60;
    sec = sum%60;
    label.text = [NSString stringWithFormat:@"您已经使用了%02d小时%02d分钟%02d秒",hour,min,sec];
    label.textColor = [UIColor blueColor];
}



@end
