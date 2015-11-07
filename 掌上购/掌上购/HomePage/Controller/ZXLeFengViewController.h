//
//  ZXLeFengViewController.h
//  掌上购
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXLeFengViewController : UIViewController
{
    int currentPage;
    BOOL isRefreshing;
    BOOL isLoading;
}
-(void)refreshAndLoad:(NSString *)path;
@end
