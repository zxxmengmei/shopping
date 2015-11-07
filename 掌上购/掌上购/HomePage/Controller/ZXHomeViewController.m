//
//  ZXHomeViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXHomeViewController.h"
#import "ZXAdDetailViewController.h"
#import "ZXHomeView.h"
#import "ZXSpDetailViewController.h"
#import "ZXServeViewController.h"
#import "ZXGoodShopViewController.h"
#import "ZXScrollView.h"
#import "ZXHomeCollectionViewCell.h"
#import "ZXChannelViewController.h"
#import "ZXLeFengViewController.h"

@interface ZXHomeViewController ()<sendInfo,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray * dataSource;
    UICollectionView * myCollectionView;
}
@end

@implementation ZXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createLeftBtn];
    
    ZXScrollView * zxScrollView = [[ZXScrollView alloc] initWithFrame:CGRectMake(0, -64, self.view.frame.size.width, 300)];
    [self.view addSubview:zxScrollView];
    
    //注册观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ad:) name:@"ad" object:nil];
    
    
    ZXHomeView * homeView = [[ZXHomeView alloc] initWithFrame:CGRectMake(0, 215, self.view.frame.size.width, 100)];
    //设置block
    __weak typeof (self) weakSelf = self;
    [homeView setPushToNextVC:^{
        ZXSpDetailViewController * detail = [[ZXSpDetailViewController alloc] init];
        [weakSelf.navigationController pushViewController:detail animated:YES];
        
    }];
    [self.view addSubview:homeView];
    
    [self createCollectionView];
    
//    请求数据
    ZXRequestModel * model = [[ZXRequestModel alloc] init];
    model.path = WANGZHAN_URL;
    model.delegate = self;
    [model startRequestInfo];

}
-(void)sendMessage:(NSData *)data andPath:(NSString *)path{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary * dict = dic[@"data"];
    NSArray * array = dict[@"channel"];
    [dataSource addObjectsFromArray:array];
    [myCollectionView reloadData];
}
-(void)createCollectionView{
    //<1>流视图
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(100, 100);
    
    myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(8, 315, self.view.frame.size.width, self.view.frame.size.height-365) collectionViewLayout:flowLayout];
    myCollectionView.dataSource = self;
    myCollectionView.delegate = self;
    myCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:myCollectionView];
    
    //<3>注册
    [myCollectionView registerNib:[UINib nibWithNibName:@"ZXHomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    dataSource = [[NSMutableArray alloc] init];
}

-(void)ad:(NSNotification*)notif{
    ZXAdDetailViewController * detail = [[ZXAdDetailViewController alloc] init];
    [detail setValue:notif.object forKey:@"urlString"];
        [self.navigationController pushViewController:detail animated:YES];
}
-(void) createLeftBtn{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"   特价" style:UIBarButtonItemStylePlain target:self action:@selector(left:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"好店 " style:UIBarButtonItemStylePlain target:self action:@selector(right:)];

}
-(void)left:(id)sender{
    ZXServeViewController * serveVC = [[ZXServeViewController alloc] init];
    NSString * string = @"http://s.gou.gionee.com/click/redirect?t=4005048571";
    [serveVC setValue:string forKey:@"string"];
    [self.navigationController pushViewController:serveVC animated:YES];
}
-(void)right:(id)sender{
    ZXGoodShopViewController * goodShopVC = [[ZXGoodShopViewController alloc] init];
    NSString * string = @"http://s.gou.gionee.com/click/redirect?t=33741031";
    [goodShopVC setValue:string forKey:@"string"];
    [self.navigationController pushViewController:goodShopVC animated:YES];
}
#pragma mark  ------UICollectionViewDataSource--------
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return dataSource.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZXHomeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    
    [cell.backImageView setImageWithURL:[NSURL URLWithString:dataSource[indexPath.row][@"img"]]];
    
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZXChannelViewController * channel = [[ZXChannelViewController alloc] init];
    
    if (indexPath.row == 2) {
        [self.navigationController pushViewController:[[ZXLeFengViewController alloc] init] animated:YES];
    }
    else if(indexPath.row == 3)
    {
        NSString * string = TMALL_URL;
       [channel setValue:string forKey:@"urlString"];
        [self.navigationController pushViewController:channel animated:YES];
    }
    else if (indexPath.row == 4){
        [channel setValue:dataSource[6][@"link"] forKey:@"urlString"];
        [self.navigationController pushViewController:channel animated:YES];
    }
    else if (indexPath.row == 5){
        [channel setValue:@"http://h5.m.taobao.com/fav/index.htm" forKey:@"urlString"];
        [self.navigationController pushViewController:channel animated:YES];
    }
    else{
      [channel setValue:dataSource[indexPath.row][@"link"] forKey:@"urlString"];
        [self.navigationController pushViewController:channel animated:YES];
    }
    
}
@end
