//
//  ZXStoryViewController.h
//  掌上购
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXStoryViewController : UIViewController
{
    int currentPage;
    BOOL isRefreshing;
    BOOL isLoading;
}
-(void)refreshAndLoad:(NSString *)path;
@end
