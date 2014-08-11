//
//  UISubview.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-8-7.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISubview : UIView{
    UILabel *_titleView;
    UIControl *_overlayView;
}

-(void)setTitle:(NSString *)title;
-(void)show;
-(void)dismiss;
@end
