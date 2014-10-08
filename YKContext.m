//
//  YKContext.m
//  MobileCheckIn
//
//  Created by Yorke on 14-9-24.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "YKContext.h"

@implementation YKContext

+(instancetype)Instance{
    static YKContext *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance=[[YKContext alloc]init];
        instance.CheckInPlace=[NSMutableArray array];
    });
    return instance;
}
@end
