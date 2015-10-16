//
//  VTSearchViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/16.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTSearchViewController.h"

@interface VTSearchViewController ()

@end

@implementation VTSearchViewController

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
    
    //self.navigationController.navigationBarHidden = NO;
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    //self.navigationController.navigationBarHidden = YES;
}

- (IBAction)goBack:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
