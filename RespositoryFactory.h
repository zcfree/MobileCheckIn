//
//  RespositoryFactory.h
//  A1
//
//  Created by Yorke on 14-9-22.
//  Copyright (c) 2014年 Yorke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APServerRepository.h"
@interface RespositoryFactory : NSObject

+(instancetype)Instance;
-(APServerRepository *)CreateAPServerRespository;

@property(nonatomic,assign)NSString *Paras;

@end