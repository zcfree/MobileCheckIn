//
//  SCanPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-30.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"
@interface SCanPage : SubBasePage<ZBarReaderDelegate,ZBarReaderViewDelegate>{
    
}

@property (weak, nonatomic) IBOutlet UITextView *TextView;
@property(nonatomic,strong)ZBarReaderView *readerView;
@end
