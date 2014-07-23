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
@interface AppPage : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *CollectionView;
@property (weak, nonatomic) IBOutlet UINavigationBar *CustomNav;
@property (weak, nonatomic) IBOutlet UINavigationItem *NavItem;

@property(nonatomic,strong)NSArray *AppArray;
@end
