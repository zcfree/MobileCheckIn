//
//  CheckInPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-18.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "UIFolderTableView.h"
#import "MapViewPage.h"

@interface CheckInPage : SubBasePage<UITableViewDataSource,UITableViewDelegate,UIFolderTableViewDelegate,MapDelegate>{

}

@property (weak, nonatomic) IBOutlet UIButton *CheckIn;
- (IBAction)CheckInClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *Record;
@property (weak, nonatomic) IBOutlet UIFolderTableView *CheckInView;
@property(assign)NSUInteger CurrentIndex;
@property(nonatomic,strong)NSMutableArray *Data;
@property(assign)BOOL IsShow;
@property(assign)NSString *note;
@end
