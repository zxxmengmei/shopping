//
//  ZXBlueprintViewController.h
//  掌上购
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXBlueprintViewController : UIViewController
{
    BOOL isRefreshing;
    BOOL isLoading;
}
-(void)refreshAndLoad:(NSString *)path;
@end
