//
//  ZXClassifyViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXClassifyViewController.h"
#import "ZXStoryViewController.h"
#import "ZXRelaxTableViewCell.h"
#import "ZXRelaxDetailViewController.h"

@interface ZXClassifyViewController ()<sendInfo,UITableViewDataSource,UITableViewDelegate>
{
    UITableView * table;
    NSMutableArray * dataSource;
}

@end

@implementation ZXClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"购物累了  轻松一下";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"小测试" style:UIBarButtonItemStylePlain target:self action:@selector(right:)];
    
    [self createTableAndData];
    //请求数据
    ZXRequestModel * model = [[ZXRequestModel alloc] init];
    currentPage = 1;
    model.path = [NSString stringWithFormat:JINGHUA_URL,currentPage];
    model.delegate = self;
    [model startRequestInfo];
   
    
}
-(void)sendMessage:(NSData *)data andPath:(NSString *)path{
    //防止刷新的时候在数据源中重复添加相同的数据
    if (currentPage == 1) {
        [dataSource removeAllObjects];
    }
    
    NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray * array1 = array[0][@"item"];
    [dataSource addObjectsFromArray:array1];
    [table reloadData];
    
}
-(void) createTableAndData{
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    table.dataSource = self;
    table.delegate = self;
    table.rowHeight = 300;
    [self.view addSubview:table];
    
    //注册自己的cell
    [table registerClass:[ZXRelaxTableViewCell class] forCellReuseIdentifier:@"ZXRelaxTableViewCell"];
    
    dataSource = [[NSMutableArray alloc] init];
    
    
    [self refreshAndLoad:JINGHUA_URL];
    
}
//实现加载刷新的方法
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXRelaxTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZXRelaxTableViewCell"];
    
    cell.titleLbl.text = dataSource[indexPath.row][@"title"];
    cell.sourceLbl.text = dataSource[indexPath.row][@"source"];
    cell.kindLbl.text = dataSource[indexPath.row][@"channel"];
    cell.likeLbl.text =  [NSString stringWithFormat:@"浏览量:  %@",dataSource[indexPath.row][@"commentsall"]];
    cell.timeLbl.text = dataSource[indexPath.row][@"updateTime"];
    [cell.backImageView setImageWithURL:[NSURL URLWithString:dataSource[indexPath.row][@"thumbnail"]]];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXRelaxDetailViewController * detail = [[ZXRelaxDetailViewController alloc] init];
    [detail setValue:dataSource[indexPath.row][@"commentsUrl"] forKey:@"urlString"];
    [self.navigationController pushViewController:detail animated:YES];
}
-(void)right:(id)sender{
    [self.navigationController pushViewController:[[ZXStoryViewController alloc] init] animated:YES];
}



@end
