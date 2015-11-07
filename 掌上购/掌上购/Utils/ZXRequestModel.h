//
//  ZXRequestModel.h
//  掌上购
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol sendInfo <NSObject>

-(void)sendMessage:(NSData*)data andPath:(NSString *)path;

@end

@interface ZXRequestModel : NSObject


@property(nonatomic,retain) NSString * path;


@property(nonatomic,assign) id<sendInfo> delegate;


-(void)startRequestInfo;

@end
