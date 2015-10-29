//
//  VTLoginViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/28.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTLoginViewController.h"

@interface VTLoginViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *forgotPasswdButton;


@end

@implementation VTLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self.forgotPasswdButton setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
}

// 关闭界面
- (IBAction)dismiss:(id)sender
{    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
