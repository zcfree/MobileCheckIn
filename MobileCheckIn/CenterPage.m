//
//  CenterPage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-17.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "CenterPage.h"
#import "ILBarButtonItem.h"
#import "MoLabel.h"
#import "CenterPageCell.h"
@interface CenterPage ()

@end

@implementation comments

-(id)initWithImageName:(NSString *)ImageName Andtitle:(NSString *)title Anddetail:(NSString *)detail Andtime:(NSString *)time{
    if(self=[super init]){
        self.ImageName=ImageName;
        self.title=title;
        self.detail=detail;
        self.time=time;
    }
    return self;
}

@end
@implementation CenterPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setImage:@"tab_bar_message" AndTitle:@"消息"];
        
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.DataArray=[NSMutableArray array];
    comments *coms1=[[comments alloc]initWithImageName:@"college_img_public" Andtitle:@"公共号" Anddetail:@"文件传输助手" Andtime:@"07-17 16:24"];
    comments *coms2=[[comments alloc]initWithImageName:@"college_img_latest" Andtitle:@"玩转欧软云" Anddetail:@"［开心周末］" Andtime:@"07-18 19:33"];
    comments *coms3=[[comments alloc]initWithImageName:@"college_img_organization" Andtitle:@"一呼百应" Anddetail:@"欢迎关注一呼百应" Andtime:@"07-17 16:24"];
    comments *coms4=[[comments alloc]initWithImageName:@"college_img_collection" Andtitle:@"欧软云团队" Anddetail:@"欢迎你使用欧软云。如果你..." Andtime:@"07-17 16:24"];
    self.DataArray=[[NSMutableArray alloc]initWithObjects:coms1,coms2,coms3,coms4, nil];

    //将它的footview初始化成一个view就可以了
    self.MainTable.tableFooterView=[[UIView alloc]init];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark tableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier=@"Cell";
    CenterPageCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil){
        cell=(CenterPageCell *)[[[NSBundle mainBundle]loadNibNamed:@"CenterPageCell" owner:self options:nil]lastObject];
        comments *coms=[self.DataArray objectAtIndex:indexPath.row];
        cell.title.text=coms.title;
        cell.imageView.image=[UIImage imageNamed:coms.ImageName];
        cell.time.text=coms.time;
        cell.detail.text=coms.detail;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    return cell;
    
}



@end
