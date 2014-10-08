//
//  YKContext.h
//  MobileCheckIn
//
//  Created by Yorke on 14-9-24.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKContext : NSObject

+(instancetype)Instance;

@property(nonatomic,strong)NSMutableArray *CheckInPlace;

@end
