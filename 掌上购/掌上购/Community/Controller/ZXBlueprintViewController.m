//
//  ZXBlueprintViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXBlueprintViewController.h"
#import "ZXBlueprintTableViewCell.h"
#import "ZXBPDetailViewController.h"


@interface ZXBlueprintViewController ()<sendInfo,UITableViewDataSource,UITableViewDelegate>
{
    UITableView * table;
    NSMutableArray * dataSource;
}

@end

@implementation ZXBlueprintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"晒图";
    
    [self createTableAndData];
    //请求数据
    ZXRequestModel * model = [[ZXRequestModel alloc] init];
    model.path = BP_URL;
    model.delegate = self;
    [model startRequestInfo];
}
-(void)sendMessage:(NSData *)data andPath:(NSString *)path{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary * dict = dic[@"data"];
    NSArray * array = dict[@"rows"];
    [dataSource addObjectsFromArray:array];
    [table reloadData];
    
}
-(void) createTableAndData{
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    table.dataSource = self;
    table.delegate = self;
    table.rowHeight = 400;
    [self.view addSubview:table];
    
    //注册自己的cell
    [table registerClass:[ZXBlueprintTableViewCell class] forCellReuseIdentifier:@"ZXBlueprintTableViewCell"];
    
    dataSource = [[NSMutableArray alloc] init];
    
    //加载刷新
    NSDate * date = [NSDate date];
    //格式化日期
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString * dateString = [formatter stringFromDate:date];
    [self refreshAndLoad:[NSString stringWithFormat:NEWBP_URL,dateString]];
    
}
//实现加载刷新的方法
-(void)refreshAndLoad:(NSString *)path{
    //<1>刷新
    [table addHeaderWithCallback:^{
        if (isRefreshing) {
            return;
        }
        
        isRefreshing = YES;
       
        ZXRequestModel * model = [[ZXRequestModel alloc] init];
        model.path = path;
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

        ZXRequestModel * model = [[ZXRequestModel alloc] init];
        model.path = path;
        model.delegate =self;
        [model startRequestInfo];

        isLoading = NO;
        
        [table footerEndRefreshing];

    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXBlueprintTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZXBlueprintTableViewCell"];
    
    cell.titleLbl.text = dataSource[indexPath.row][@"article_title"];
    cell.kindLbl.text = dataSource[indexPath.row][@"article_type_name"];
    cell.likeLbl.text =  [NSString stringWithFormat:@"赞:  %@",dataSource[indexPath.row][@"article_favorite"]];
    cell.timeLbl.text = dataSource[indexPath.row][@"article_date"];
    [cell.backImageView setImageWithURL:[NSURL URLWithString:dataSource[indexPath.row][@"article_pic"]]];
    cell.contentTextView.text = dataSource[indexPath.row][@"article_filter_content"];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXBPDetailViewController * detail = [[ZXBPDetailViewController alloc] init];
    [detail setValue:dataSource[indexPath.row][@"article_url"] forKey:@"urlString"];
    [self.navigationController pushViewController:detail animated:YES];
}
@end
