//
//  UISubview.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-8-7.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "UISubview.h"
@interface UISubview()

-(void)defaultInit;
-(void)fadeIn;
-(void)fadeOut;

@end

@implementation UISubview

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultInit];
        // Initialization code
    }
    return self;
}

-(void)defaultInit{
    self.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    self.layer.borderWidth=1.0f;
    self.layer.cornerRadius=10.0f;
    self.clipsToBounds=true;
    
    _titleView=[[UILabel alloc]initWithFrame:CGRectZero];
    _titleView.font=[UIFont systemFontOfSize:17.0f];
    _titleView.backgroundColor = [UIColor colorWithRed:59./255.
                                                 green:89./255.
                                                  blue:152./255.
                                                 alpha:1.0f];
    _titleView.textAlignment=NSTextAlignmentCenter;
    _titleView.textColor=[UIColor whiteColor];
    CGFloat xWidth = self.bounds.size.width;
    _titleView.lineBreakMode = NSLineBreakByTruncatingTail;
    _titleView.frame = CGRectMake(0, 0, xWidth, 32.0f);
    [self addSubview:_titleView];
    
    _overlayView=[[UIControl alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    _overlayView.backgroundColor=[UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
    [_overlayView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)setTitle:(NSString *)title{
    _titleView.text=title;
}

-(void)fadeIn{
    self.transform=CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha=0;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha=1;
        self.transform=CGAffineTransformMakeScale(1, 1);
    }];
}

-(void)fadeOut{
    [UIView animateWithDuration:.35 animations:^{
        self.transform=CGAffineTransformMakeScale(1.3, 1.3);
        self.alpha=0.0;
    }completion:^(BOOL finished) {
        if(finished){
            [_overlayView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
}

-(void)show{
    UIWindow *keywindow=[[UIApplication sharedApplication]keyWindow];
    [keywindow addSubview:_overlayView];
    [keywindow addSubview:self];
    
    self.center=CGPointMake(keywindow.bounds.size.width/2.0f, keywindow.bounds.size.height/2.0f);
    [self fadeIn];
}

-(void)dismiss{
    [self fadeOut];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self dismiss];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
