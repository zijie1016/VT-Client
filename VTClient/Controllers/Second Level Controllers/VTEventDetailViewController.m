//
//  VTEventDetailViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/27.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTEventDetailViewController.h"
#import "DLTabedSlideView.h"
#import "VTEvent.h"
#import "VTEventHomeTableViewController.h"
#import "VTEventParticipantsViewController.h"
#import "VTEventEntriesViewController.h"

@interface VTEventDetailViewController () <DLTabedSlideViewDelegate>

@property (weak, nonatomic) IBOutlet DLTabedSlideView *slideView;


@end

@implementation VTEventDetailViewController


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置DLSlideView
    self.slideView.baseViewController = self;
    self.slideView.tabItemNormalColor = [UIColor blackColor];
    self.slideView.tabItemSelectedColor = [UIColor colorWithRed:0.833 green:0.052 blue:0.130 alpha:1.000];
    self.slideView.tabbarTrackColor = [UIColor colorWithRed:0.833 green:0.052 blue:0.130 alpha:1.000];
    //self.slideView.tabbarBackgroundImage = [UIImage imageNamed:@"textFile@2x"];
    self.slideView.tabbarBottomSpacing = 3.0;
    DLTabedbarItem *item1 = [DLTabedbarItem itemWithTitle:@"首页" image:nil selectedImage:nil];
    DLTabedbarItem *item2 = [DLTabedbarItem itemWithTitle:@"参赛会员" image:nil selectedImage:nil];
    DLTabedbarItem *item3 = [DLTabedbarItem itemWithTitle:@"参赛作品" image:nil selectedImage:nil];
    
    self.slideView.tabbarItems = @[item1,item2,item3];
    
    [self.slideView buildTabbar];
    self.slideView.selectedIndex = 0;

}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

-(NSInteger)numberOfTabsInDLTabedSlideView:(DLTabedSlideView *)sender
{
    return self.slideView.tabbarItems.count;
    
}

-(UIViewController *)DLTabedSlideView:(DLTabedSlideView *)sender controllerAt:(NSInteger)index
{
    switch (index)
    {
        case 0:
        {
            VTEventHomeTableViewController *ehtvc = [[VTEventHomeTableViewController alloc]init];
            ehtvc.event = self.event;
            return ehtvc;
//            HomePageViewController *VVC = [[HomePageViewController alloc] init];
//            VVC.event = self.event;
//            //VVC.detailEvent = self.event;
//            return VVC;
        }
        case 1:
        {
            VTEventParticipantsViewController *epvc = [[VTEventParticipantsViewController alloc]init];
            return epvc;
//            MatchMemberViewController *EVC = [[MatchMemberViewController alloc] initWithNibName:@"MatchMemberViewController" bundle:nil];
//            EVC.event = self.event;
//            return EVC;
        }
        case 2:
        {
            VTEventEntriesViewController *eevc = [[VTEventEntriesViewController alloc]init];
            return eevc;
//            MatchWorksViewController *FVC = [[MatchWorksViewController alloc] init];
//            FVC.event = self.event;
//            return FVC;
            
        }
            
        default:
            return nil;
    }
    
}


@end
