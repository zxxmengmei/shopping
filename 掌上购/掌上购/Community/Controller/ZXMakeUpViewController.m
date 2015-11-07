//
//  ZXMakeUpViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXMakeUpViewController.h"
#import "ZXMakeUpTableViewCell.h"
#import "ZXMakeUpDetailViewController.h"
#import "ZXBlueprintViewController.h"
#import "ZXMoreViewController.h"


@interface ZXMakeUpViewController ()<sendInfo,UITableViewDataSource,UITableViewDelegate>
{
    UITableView * table;
    NSMutableArray * dataSource;

}

@end

@implementation ZXMakeUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableAndData];
    //请求数据
    ZXRequestModel * model = [[ZXRequestModel alloc] init];
    model.path = SQ_URL;
    model.delegate = self;
    [model startRequestInfo];
    
    [self createBarButtonItem];
}
-(void) createBarButtonItem{
    UIButton  * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(0, 0, 60, 30);
    [btn setTitle:@"美容顾问" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(right:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    
    
    UIButton  * btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame=CGRectMake(0, 0, 60, 30);
    [btn1 setTitle:@"来看晒图" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(left:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:btn1];
}
-(void)left:(id)sender{
    [self.navigationController pushViewController:[[ZXBlueprintViewController alloc] init] animated:YES];
}
-(void)right:(id)sender{
    [self.navigationController pushViewController:[[ZXMoreViewController alloc] init] animated:YES];
}

-(void)sendMessage:(NSData *)data andPath:(NSString *)path{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary * dict = dic[@"data"];
    NSArray * array = dict[@"list"];
    [dataSource addObjectsFromArray:array];
    [table reloadData];
    
}
-(void) createTableAndData{
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    table.dataSource = self;
    table.delegate = self;
    table.rowHeight = 180;
    [self.view addSubview:table];
    //注册自己的cell
    [table registerClass:[ZXMakeUpTableViewCell class] forCellReuseIdentifier:@"ZXMakeUpTableViewCell"];
   
    dataSource = [[NSMutableArray alloc] init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -------UITableViewDataSource------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXMakeUpTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZXMakeUpTableViewCell"];
    
    cell.titleLbl.text = dataSource[indexPath.row][@"title"];
    cell.detailLbl.text = dataSource[indexPath.row][@"summary"];
    cell.timeLbl.text = [NSString stringWithFormat:@"时间:%@", dataSource[indexPath.row][@"start_time"]];
    cell.authorLbl.text = [NSString stringWithFormat:@"作者:%@",dataSource[indexPath.row][@"author"]];
    cell.likeLbl.text = [NSString stringWithFormat:@"赞: %@",dataSource[indexPath.row][@"favorite"]];
    [cell.leftImageView setImageWithURL:[NSURL URLWithString:dataSource[indexPath.row][@"images"][0]]];
    [cell.middleImageView setImageWithURL:[NSURL URLWithString:dataSource[indexPath.row][@"images"][1]]];
    [cell.rightImageView setImageWithURL:[NSURL URLWithString:dataSource[indexPath.row][@"images"][2]]];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXMakeUpDetailViewController * detail = [[ZXMakeUpDetailViewController alloc] init];
    [detail setValue:dataSource[indexPath.row][@"url"] forKey:@"urlString"];
    [self.navigationController pushViewController:detail animated:YES];
    
}
@end
