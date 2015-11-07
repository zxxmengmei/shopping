//
//  AppDelegate.m
//  掌上购
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "AppDelegate.h"
#import "Reachability.h"
#import "ZXHomeViewController.h"
#import "ZXLeftViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //<1>获取plist文件的路径
    NSString * path = [[NSBundle mainBundle] pathForResource:@"title" ofType:@"plist"];
    //<2>读取plist文件的内容
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:path];
    //<3>获取所有的键值
    NSArray * keys = @[@"one",@"two",@"three",@"four"];
    //<4>定义一个数组存放所有的子视图控制器
    NSMutableArray * controllers = [[NSMutableArray alloc] init];
    //<5>遍历字典 获取视图控制器的名称
    for (int i = 0; i<keys.count; i++) {
        NSDictionary * smallDic = [dic objectForKey:keys[i]];
        //<6>获取视图控制器的字符串名称
        NSString * controllerStr = smallDic[@"controllerName"];
        
        //<7>将字符串名称转化成类名
        Class controllerClass = NSClassFromString(controllerStr);
        
        //<8>创建视图控制器对象
        
        UIViewController * controller = [[controllerClass alloc] init];
        
        //<9>添加导航控制器
        UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:controller];
        
        //<10>为导航条添加标题  同时为tabBar添加标题
        NSString * titleStr = smallDic[@"titleName"];
        controller.navigationItem.title = titleStr;
        navi.tabBarItem.title = titleStr;
        
        //<11>为tabBar添加图片按钮
        NSString * imageStr = smallDic[@"imageName"];
        navi.tabBarItem.image = [UIImage imageNamed:imageStr];
        
        NSString * selectImageStr = smallDic[@"selectedImage"];
        navi.tabBarItem.selectedImage = [UIImage imageNamed:selectImageStr];
        
        //<12>将导航控制器添加到数组中
        [controllers addObject:navi];
        
        //<13>为导航条添加背景图片
        [navi.navigationBar setBackgroundImage:[UIImage imageNamed:@"kd_wx_ok_h"] forBarMetrics:UIBarMetricsDefault];
        
        
    
    }
    //<14>创建tabBarController
    UITabBarController * tabBarCtr = [[UITabBarController alloc] init];
    tabBarCtr.viewControllers = controllers;
    
   
    //初始化ddMenuController对象
    self.ddMC = [[DDMenuController alloc] initWithRootViewController:tabBarCtr];
    ZXLeftViewController * left = [[ZXLeftViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:left];
    self.ddMC.leftViewController = nav;
    
    
    self.window.rootViewController = self.ddMC;
    
    [self isConnectionAvailable];
    
    return YES;
}
//判断网络的连接状态
-(BOOL) isConnectionAvailable{
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    if (!isExistenceNetwork)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查网络连接！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        return NO;
    }
    return isExistenceNetwork;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
