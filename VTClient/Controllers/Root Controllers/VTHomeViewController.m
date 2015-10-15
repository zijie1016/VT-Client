//
//  VTHomeViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/15.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTHomeViewController.h"

@interface VTHomeViewController ()

@property (weak, nonatomic) IBOutlet UIView *navBar;

@end

@implementation VTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBar];
}

//设置自定义的导航栏
- (void)setupNavBar
{
    //隐藏系统导航栏
    self.navigationController.navigationBarHidden = YES;
    
}

@end
