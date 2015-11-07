//
//  ZXLeFengViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXLeFengViewController.h"
#import "ZXLeFengTableViewCell.h"

@interface ZXLeFengViewController ()<sendInfo,UITableViewDataSource,UITableViewDelegate>
{
    UITableView * table;
    NSMutableArray * dataSource;
}
@end

@implementation ZXLeFengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"乐蜂";
    
    [self createTableAndData];
    
   // 请求数据
    ZXRequestModel * model = [[ZXRequestModel alloc] init];
    currentPage = 1;
    model.path = [NSString stringWithFormat:LEFENG_URL,currentPage];
    model.delegate = self;
    [model startRequestInfo];
    
//    刷新加载
    [self refreshAndLoad:LEFENG_URL];
    
}
-(void)sendMessage:(NSData *)data andPath:(NSString *)path{
    
    //防止刷新的时候在数据源中重复添加相同的数据
    if (currentPage == 1) {
        [dataSource removeAllObjects];
    }
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray * array = dic[@"data"];
    NSArray * array1 = array[0][@"products"];
    [dataSource addObjectsFromArray:array1];
    [table reloadData];
}
-(void)createTableAndData{
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    table.dataSource = self;
    table.delegate = self;
    table.rowHeight = 120;
    [self.view addSubview:table];
    
//    注册cell
    [table registerClass:[ZXLeFengTableViewCell class] forCellReuseIdentifier:@"ZXLeFengTableViewCell"];
    
    dataSource = [[NSMutableArray alloc] init];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXLeFengTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZXLeFengTableViewCell"];
    [cell.headImageView setImageWithURL:[NSURL URLWithString:dataSource[indexPath.row][@"imgUrl_3"]]];
    cell.nameTextView.text = dataSource[indexPath.row][@"productName"];
    cell.currentPriceLbl.text = [NSString stringWithFormat:@"¥%@",dataSource[indexPath.row][@"salePrice"]];
    cell.originalPriceLbl.text = [NSString stringWithFormat:@"¥%@",dataSource[indexPath.row][@"marketPrice"]];
    cell.discountLbl.text = [NSString stringWithFormat:@"%@折",dataSource[indexPath.row][@"discount"]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"抱歉亲，此网站还没有对我们开放哦😭\n我们会继续努力的!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}
-(void)refreshAndLoad:(NSString *)path{
    //<1>刷新
    [table addHeaderWithCallback:^{
        if (isRefreshing) {
            return;
        }
        isRefreshing = YES;
        currentPage = 1;
        
        //重新拼接接口
        NSString * allPath = [NSString stringWithFormat:path,currentPage];
        
        ZXRequestModel * model = [[ZXRequestModel alloc] init];
        model.path = allPath;
        model.delegate = self;
        [model startRequestInfo];
        
        isRefreshing = NO;
        //能将刷新视图隐藏
        [table headerEndRefreshing];
    }];
    //<2>加载
    [table addFooterWithCallback:^{
        if (isLoading) {
            return;
        }
        isLoading = YES;
        currentPage++;
        
        NSString * allPath = [NSString stringWithFormat:path,currentPage];
        ZXRequestModel * model = [[ZXRequestModel alloc] init];
        model.path = allPath;
        model.delegate =self;
        [model startRequestInfo];

        isLoading = NO;
        [table footerEndRefreshing];

    }];
}
@end
