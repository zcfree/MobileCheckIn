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
         self.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"主页" image:[UIImage imageNamed:@"tab_bar_discovery_normal"] selectedImage:[UIImage imageNamed:@"tab_bar_discovery_highlight"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ILBarButtonItem *settingsBtn =
    [ILBarButtonItem barItemWithImage:[UIImage imageNamed:@"navigationItem_menu"] selectedImage:[UIImage imageNamed:@"navigationItem_menu_hl"]
                               target:self
                               action:@selector(leftTapped:)];
    self.NavItem.leftBarButtonItem=settingsBtn;
    MoLabel *label=[MoLabel LabelWithTitle:@"主页"];
    self.NavItem.titleView = label;
    [self.CustomNav setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg"] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view from its nib.
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
