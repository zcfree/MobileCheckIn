//
//  SCanPage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-30.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "SCanPage.h"
#import "ILBarButtonItem.h"
#import "MoLabel.h"
@interface SCanPage ()

@end

@implementation SCanPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"二维码扫描";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.readerView=[[ZBarReaderView alloc]init];
    self.readerView.frame=CGRectMake(20, 60, 280, 280);
    self.readerView.readerDelegate=self;
    self.readerView.torchMode=0;
    self.readerView.layer.cornerRadius=10;
    if(TARGET_IPHONE_SIMULATOR){
        ZBarCameraSimulator *cameraSimulator=[[ZBarCameraSimulator alloc]initWithViewController:self];
        cameraSimulator.readerView=self.readerView;
    }
    [self.view addSubview:self.readerView];
    //设置扫描区域
//    CGRect scanMaskRect=CGRectMake(60, 200, 200, 200);
//    self.readerView.scanCrop=[self getScanCorp:scanMaskRect readerViewBounds:self.readerView.bounds];
    
    [self.readerView start];
    // Do any additional setup after loading the view from its nib.
}

-(CGRect)getScanCorp:(CGRect)rect readerViewBounds:(CGRect)readerViewBounds{
    CGFloat x,y,width,height;
    
    x=rect.origin.x/readerViewBounds.size.width;
    y=rect.origin.y/readerViewBounds.size.height;
    width=rect.size.width/readerViewBounds.size.width;
    height=rect.size.height/readerViewBounds.size.height;
    
    return CGRectMake(x, y, width, height);
}

-(void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image{
    for (ZBarSymbol *symbol in symbols) {
        NSLog(@"%@",symbol.data);
        self.TextView.text=symbol.data;
        break;
    }
    
    [self.readerView stop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
