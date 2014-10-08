//
//  APServerRepository.m
//  A1
//
//  Created by Yorke on 14-9-22.
//  Copyright (c) 2014年 Yorke. All rights reserved.
//

#import "APServerRepository.h"

@interface APServerRepository(){
    NSString *publicString;
}
@end

@implementation APServerRepository

#pragma Mark InitMethod
-(id)initialize:(NSString *)PublicString{
    publicString=PublicString;
    NSLog(@"%@",publicString);
    return self;
}
@end
