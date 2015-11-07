//
//  ZXScrollView.m
//  掌上购
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "ZXScrollView.h"

@implementation ZXScrollView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        //请求数据
        ZXRequestModel * model = [[ZXRequestModel alloc] init];
        model.path = AD_URL;
        model.delegate = self;
        [model startRequestInfo];
        
        
        timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scroll) userInfo:nil repeats:YES ];
    }
    return self;
}
-(void)sendMessage:(NSData *)data andPath:(NSString *)path{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary * dict = dic[@"data"];
    NSArray * array = dict[@"ads"];
    _data = [[NSMutableArray alloc] init];
    [_data addObjectsFromArray:array];
    
    [self initUIData];
}
- (void)initUIData{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.frame.size.width, 150)];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    
    
    for (int i=0; i<_data.count; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, 150)];
        [imageView setImageWithURL:[NSURL URLWithString:_data[i][@"img"]]];
        imageView.tag = i+1;
        //为图片视图添加点击事件
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [imageView addGestureRecognizer:tap];
        [_scrollView addSubview:imageView];
    }
    _scrollView.contentSize = CGSizeMake(_data.count*self.frame.size.width, 0);
    _scrollView.contentOffset = CGPointMake(0, 0);
    [self addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(10, 200, 200, 17)];
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.numberOfPages = _data.count;
    _pageControl.currentPage = 0;
    [self addSubview:_pageControl];
}

//图片的点击事件
-(void) tapAction:(UIGestureRecognizer*)tap{
    UIImageView * imageView = (UIImageView*)tap.view;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ad" object:_data[imageView.tag-1][@"link"]];
}
-(void)scroll{
    
    if (_pageControl.currentPage == _pageControl.numberOfPages-1) {
        _pageControl.currentPage =0;
    }
    else {
        _pageControl.currentPage++;
    }
    CGFloat offSetX = _pageControl.currentPage*_scrollView.frame.size.width;
    [_scrollView setContentOffset:CGPointMake(offSetX, 0) animated:YES];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _pageControl.currentPage = scrollView.contentOffset.x/self.frame.size.width;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = _scrollView.contentOffset.x;
    offsetX = offsetX + (_scrollView.frame.size.width * 0.5);
    
    //pageControll改变
    int page = offsetX /_scrollView.frame.size.width;
    _pageControl.currentPage = page;
}
//开始拖拽时
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    [timer setFireDate:[NSDate distantFuture]];
}
//结束拖拽时
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [timer setFireDate:[NSDate distantPast]];
}

@end
