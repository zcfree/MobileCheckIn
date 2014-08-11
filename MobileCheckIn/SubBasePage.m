//
//  SubBasePage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-7-31.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "SubBasePage.h"
#import "ILBarButtonItem.h"
#import "MoLabel.h"

@interface SubBasePage ()

@end

@implementation SubBasePage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UINavigationBar *CustomNav = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UINavigationItem *NavItem = [[UINavigationItem alloc] initWithTitle:nil];
    [CustomNav pushNavigationItem:NavItem animated:NO];
    [self.view addSubview:CustomNav];
    ILBarButtonItem *settingsBtn =
    [ILBarButtonItem barItemWithImage:[UIImage imageNamed:@"navigationItem_back"] selectedImage:[UIImage imageNamed:@"navigationItem_back_hl"]
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
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
