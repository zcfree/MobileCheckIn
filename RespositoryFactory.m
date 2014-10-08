//
//  RespositoryFactory.m
//  A1
//
//  Created by Yorke on 14-9-22.
//  Copyright (c) 2014年 Yorke. All rights reserved.
//
#define StaticString @"Get"

#import "RespositoryFactory.h"
#import "APServerRepository.h"

@implementation RespositoryFactory

+(instancetype)Instance{
    static RespositoryFactory *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance=[[RespositoryFactory alloc]init];
    });
    return instance;
}

-(APServerRepository *)CreateAPServerRespository{
    return [[APServerRepository alloc]initialize:StaticString];
}

@end
