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

@interface VTEventDetailViewController ()

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
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

@end
