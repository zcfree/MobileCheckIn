//
//  LeftPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-17.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//
/**
 *  侧边栏模块  个人中心  
 
    完成登录功能等
 */
#import <UIKit/UIKit.h>

@interface LeftPage : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnExit;
- (IBAction)ExitAction:(id)sender;
@end
