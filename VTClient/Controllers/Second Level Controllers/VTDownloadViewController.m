//
//  VTDownloadViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/26.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTDownloadViewController.h"

@interface VTDownloadViewController ()

@end

@implementation VTDownloadViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // 自定义返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"backt.png"] style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
