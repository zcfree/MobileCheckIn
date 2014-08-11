//
//  AppPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-17.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//
/**
 *  应用模块 可以自定义 功能有：
 *

 */
#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
@interface AppPage : BasePage<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *CollectionView;

@property(nonatomic,strong)NSArray *AppArray;
@end
