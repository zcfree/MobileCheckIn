//
//  AppPage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-17.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "AppPage.h"
#import "CollectionCell.h"
#import "CheckInPage.h"
#import "SCanPage.h"
#import "ILBarButtonItem.h"
#import "MoLabel.h"
#import "Model.h"
#define CellCount 4
@interface AppPage ()

@end

@implementation AppPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setImage:@"tab_bar_app" AndTitle:@"应用"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Model *Model1=[[Model alloc]initImageName:@"app_img_qiandao.png" AndTitleName:@"签到"];
    Model *Model2=[[Model alloc]initImageName:@"app_img_soyisao.png" AndTitleName:@"扫描"];
    self.AppArray=[NSArray arrayWithObjects:Model1,Model2, nil];
    [self.CollectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    self.CollectionView.backgroundColor=[UIColor whiteColor];
        // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return CellCount;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if(self.AppArray.count%CellCount==0){
        return self.AppArray.count/CellCount;
    }else{
        return self.AppArray.count/CellCount + 1;
    }
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * CellIdentifier = @"CollectionCell";
    CollectionCell * cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if(self.AppArray.count>indexPath.row){
        Model *model=[self.AppArray objectAtIndex:indexPath.row];
        cell.AppCell.image=[UIImage imageNamed:model.ImageName];
        cell.CellTitle.text=model.TitleName;
    }
    return cell;
    
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(50, 70);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 30, 30, 30);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){
        CheckInPage * CheckInView=[[CheckInPage alloc]initWithNibName:@"CheckInPage" bundle:nil];
        [self.navigationController pushViewController:CheckInView animated:YES];
    }
    if(indexPath.row==1){
        SCanPage * SCanView=[[SCanPage alloc]initWithNibName:@"SCanPage" bundle:nil];
        [self.navigationController pushViewController:SCanView animated:YES];
    }
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}




@end
