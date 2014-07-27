//
//  BasePage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-7-26.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
@interface BasePage : UIViewController

@property(nonatomic,strong)NSString *image;

-(void)setImage:(NSString *)image AndTitle:(NSString *)title;
@end
