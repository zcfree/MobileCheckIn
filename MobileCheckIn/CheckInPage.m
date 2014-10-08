//
//  CheckInPage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-18.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "CheckInPage.h"
#import "TableViewCell.h"
#import "MJRefresh.h"
#import "MoLabel.h"
#import "ILBarButtonItem.h"
#import "NSString+deviceString.h"
#import "MapViewPage.h"
#import "YKContext.h"
#import "SubViewPage.h"
#import "UISubview.h"
@interface CheckInPage ()<MJRefreshBaseViewDelegate>{
    MJRefreshHeaderView *_header;
    SubViewPage *SubVP;
}

@end

@implementation CheckInPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"移动签到";
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    if(self.IsShow){
        UISubview *Subview=[[UISubview alloc]initWithFrame:CGRectMake(10, 100, 200, 200)];
        [Subview setTitle:@"Select..."];
        [Subview show];
        [[YKContext Instance].CheckInPlace addObject:self.note];
    }
    
    self.Data=[YKContext Instance].CheckInPlace;
    [self.CheckInView reloadData];
    
}

#pragma Mark MapDelegate
-(void)IsShowView:(BOOL)flag Note:(NSString *)note{
    self.IsShow=flag;
    self.note=note;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"signin_bg"]];
    
    UILabel *Month=[[UILabel alloc]initWithFrame:CGRectMake(35, 67, 30, 20)];
    UILabel *Day=[[UILabel alloc]initWithFrame:CGRectMake(26, 88, 40, 40)];
    
    [Month setTextColor:[UIColor whiteColor]];
    [Day setTextColor:[UIColor blackColor]];
    Month.font=[UIFont fontWithName:nil size:15];
    Day.font=[UIFont fontWithName:nil size:35];
    NSDate *date=[NSDate date];
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *comps;
    comps=[calendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:date];
    Month.text=[NSString stringWithFormat:@"%ld月",(long)[comps month]];
    Day.text=[NSString stringWithFormat:@"%ld",(long)[comps day]];
    [Day setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:Month];
    [self.view addSubview:Day];
    _header=[[MJRefreshHeaderView alloc]init];
    _header.delegate=self;
    _header.scrollView=self.CheckInView;
    [_header endRefreshing];
    self.CheckInView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"signin_bg"]];
    self.CheckInView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.CheckIn setImage:[UIImage imageNamed:@"signin_button_hl"] forState:UIControlStateHighlighted];
  
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
    [_header endRefreshing];
    self.Record.text=[NSString stringWithFormat:@"我的签到记录%d条",(int)self.Data.count];
    return self.Data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier=@"Cell";

    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil){
        cell=(TableViewCell *)[[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil]lastObject];
        cell.label.text=[self.Data objectAtIndex:[self Upsidedown:indexPath.row]];
        cell.label.font=[UIFont fontWithName:nil size:15];
        cell.backgroundColor=[UIColor clearColor];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
    
}

-(NSInteger)Upsidedown:(NSInteger)indexPathRow{
    NSInteger Num=(NSInteger)[self.Data count]-indexPathRow-1;
    return Num;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.CurrentIndex=indexPath.row;
    //点击添加功能
    SubViewPage *subVc = [[SubViewPage alloc]
                                     initWithNibName:NSStringFromClass([SubViewPage class])
                                     bundle:nil];
    subVc.CheckIn=self;
    self.CheckInView.scrollEnabled = NO;
    UIFolderTableView *folderTableView = (UIFolderTableView *)tableView;
    [folderTableView openFolderAtIndexPath:indexPath WithContentView:subVc.view
                                 openBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
                                     // opening actions
                                 }
                                closeBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
                                    // closing actions
                                }
                           completionBlock:^{
                               // completed actions
                               self.CheckInView.scrollEnabled = YES;
                           }];
    
}

-(CGFloat)tableView:(UIFolderTableView *)tableView xForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark 代理方法-进入刷新状态就会调用
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    //刷新数据源
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.CheckInView reloadData];
    });
    
}

- (IBAction)CheckInClick:(id)sender {
    
    MapViewPage *mapViewPage=[[MapViewPage alloc]initWithNibName:@"MapViewPage" bundle:nil];
    mapViewPage.delegate=self;
    
    [self.navigationController pushViewController:mapViewPage animated:YES];
}


-(void)subCateBtnAction:(UIButton *)btn
{
    if(btn.tag==0){
        
    }else if (btn.tag==1){
        
    }
}





@end
