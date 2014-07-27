//
//  BasePage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-7-26.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "BasePage.h"
#import "ILBarButtonItem.h"
#import "MoLabel.h"

@interface BasePage ()

@end

@implementation BasePage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)setImage:(NSString *)image AndTitle:(NSString *)title {
    self.image=image; self.title=title;
    NSString *imageNormal=[NSString stringWithFormat:@"%@_normal",self.image];
    NSString *imageHighlight=[NSString stringWithFormat:@"%@_highlight",self.image];
    self.tabBarItem=[[UITabBarItem alloc]initWithTitle:self.title image:[UIImage imageNamed:imageNormal] selectedImage:[UIImage imageNamed:imageHighlight]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UINavigationBar *CustomNav = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UINavigationItem *NavItem = [[UINavigationItem alloc] initWithTitle:nil];
    [CustomNav pushNavigationItem:NavItem animated:NO];
    //把导航栏添加到视图中
    [self.view addSubview:CustomNav];
    ILBarButtonItem *settingsBtn =
    [ILBarButtonItem barItemWithImage:[UIImage imageNamed:@"navigationItem_menu"] selectedImage:[UIImage imageNamed:@"navigationItem_menu_hl"]
                               target:self
                               action:@selector(leftTapped:)];
    NavItem.leftBarButtonItem=settingsBtn;
    MoLabel *label=[MoLabel LabelWithTitle:self.title];
    NavItem.titleView = label;
    [CustomNav setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg"] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)leftTapped:(id)sender{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

@end
