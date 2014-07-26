//
//  CenterPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-17.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//
/**
 *  消息模块  功能有：

 */
#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
@interface CenterPage : BasePage
@property (weak, nonatomic) IBOutlet UITableView *MainTable;
@property(nonatomic,strong)NSMutableArray *DataArray;
@end
/**
 *  消息模块 每个cell 用到的model
 */
@interface comments : NSObject
@property(assign)NSString *ImageName;
@property(assign)NSString *title;
@property(assign)NSString *detail;
@property(assign)NSString *time;

-(id)initWithImageName:(NSString *)ImageName Andtitle:(NSString *)title Anddetail:(NSString *)detail Andtime:(NSString *)time;
@end
