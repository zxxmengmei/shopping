//
//  ZXScrollView.h
//  掌上购
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXScrollView : UIScrollView<sendInfo,UIScrollViewDelegate>
{
    UIScrollView * _scrollView;
    UIPageControl * _pageControl;
    NSTimer * timer;
    NSArray * picArr;
    NSMutableArray * _data;
}

@end
