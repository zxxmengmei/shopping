//
//  ZXRequestModel.m
//  掌上购
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXRequestModel.h"
#import "MMProgressHUD.h"
#import "AFHTTPRequestOperationManager.h"

@implementation ZXRequestModel
-(void)startRequestInfo{
    //<1>创建请求操作管理者对象
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //<2>关闭自动解析方法
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
//    //添加一个动态加载控件
//    //1.设置样式
//    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
//    //2.设置标题
//    [MMProgressHUD showDeterminateProgressWithTitle:nil status:@"拼命加载中"];
    
    //<3>开始请求数据（请求的数据是NSdata类型）由于不确定解析以后的数据是使用数组存放还是字典存放 所以将解析功能关闭
    [manager GET:self.path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //将请求的数据反馈给视图控制器
        if ([self.delegate respondsToSelector:@selector(sendMessage:andPath:)]) {
            [self.delegate sendMessage:responseObject andPath:self.path];
        }
        else{
            NSLog(@"被动方没有实现协议中的方法");
        }
        
//        //将动态加载控件移除
//        [MMProgressHUD dismissWithSuccess:@"加载完成"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error.description);
    }];
}
@end
