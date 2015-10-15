//
//  VTMainTabBarController.m
//  VTClient
//
//  Created by 汪磊 on 15/10/12.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTMainTabBarController.h"

@interface VTMainTabBarController ()

@end

@implementation VTMainTabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];

    //设置tab bar按钮图标
    for (int index = 0; index < 4; index++)
    {
        UITabBarItem *item = [self.tabBar.items objectAtIndex:index];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar%d",index+1]];
        UIImage *imageact = [UIImage imageNamed:[NSString stringWithFormat:@"tabbaract%d",index+1]];
        [item setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item setSelectedImage:[imageact imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }

}

////设置值允许播放界面可以横屏 其他都竖屏 播放界面view 的 tag为1314
//- (BOOL)shouldAutorotate
//{
//    UINavigationController *vc = (UINavigationController *)self.selectedViewController;
//    
//    if (vc.visibleViewController.view.tag == 1314) {
//        return YES;
//    }
//    return NO;
//}

//-(void)loadCustomTabBar
//{
//
//    //初始化自定义tabbar背景
//    UIImageView *tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-49, self.view.bounds.size.width, 49)];
//    tabBarBG.userInteractionEnabled = YES;
//    //tabBarBG.image = [UIImage imageNamed:@"bottomBg"];
//    [self.view addSubview:tabBarBG];
//
//    //初始化自定义tabbarItem ->button
//    float coorinateX = 0;
//    for (int index = 0; index < 4; index++)
//    {
//        UIButton *BarItem = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        BarItem.frame = CGRectMake(18+coorinateX, 49.0/2-20, 40, 49);
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar%d",index+1]];
//        UIImage *imageact = [UIImage imageNamed:[NSString stringWithFormat:@"tabbaract%d",index+1]];
//        [BarItem setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//        [BarItem setImage:[imageact imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
//        [tabBarBG addSubview:BarItem];
//        coorinateX += 80;
//    }
//
//}

@end
