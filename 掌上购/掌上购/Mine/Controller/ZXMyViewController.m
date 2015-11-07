//
//  ZXMyViewController.m
//  掌上购
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXMyViewController.h"
#import "ZXMyView.h"
#import "ZXSettingViewController.h"
#import "ZXLoginViewController.h"
#import "FMDatabase.h"

@interface ZXMyViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

{
    FMDatabase * fmdb;
    ZXMyView * myView;
}
@end

@implementation ZXMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    myView = [[ZXMyView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //设置block
    __weak typeof (self) weakSelf = self;
    [myView setPushToLRVC:^{
        [weakSelf.navigationController pushViewController:[[ZXLoginViewController alloc] init] animated:YES];//为了避免循环引用
    }];
    [myView setSend:^(NSInteger a) {
        if (a == 100) {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"您还没有收藏宝贝哦😊" delegate:weakSelf cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }
        else if(a == 200){
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"购物车里还是空的哦😊" delegate:weakSelf cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }
        else if (a == 300){
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"您还没有买过宝贝哦😊" delegate:weakSelf cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }
    }];
    

    [self.view addSubview:myView];
    
    [self barButtonItem];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [myView.headImageView addGestureRecognizer:tap];
}

-(void)tap:(UITapGestureRecognizer*)tap{
    [self createTable];
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate =self;
    [self presentViewController:picker animated:YES completion:nil];
}
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
    myView.headImageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    [self save:image];
}
-(void)save:(UIImage *)headImage{
   NSString * sql = @"insert into Users (image,name) values(?,?)";
    NSString * name = @"haha";
    UIImage * image = headImage;
    NSData * imageData = UIImagePNGRepresentation(image);
    [fmdb executeUpdate:sql,imageData,name];
    
}
-(void)createTable{
    //建库
    NSString * path =[NSHomeDirectory() stringByAppendingFormat:@"/Documents/Users.db"];
    
    fmdb = [[FMDatabase alloc] initWithPath:path];
    BOOL isOpen = [fmdb open];
    if (isOpen) {
       
        //创建表格
        NSString * sql = @"create table if not exists Users(image blob,name varchar(256))";
        [fmdb executeUpdate:sql];

    }
}
//左右按钮
-(void)barButtonItem{
    UIButton  * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(0, 0, 30, 30);
    btn.backgroundColor=[UIColor colorWithPatternImage:[[UIImage imageNamed:@"设置_1"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] ];
    [btn addTarget:self action:@selector(right:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
}
-(void)right:(id)sender{
    [self.navigationController pushViewController:[[ZXSettingViewController alloc] init] animated:YES];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
