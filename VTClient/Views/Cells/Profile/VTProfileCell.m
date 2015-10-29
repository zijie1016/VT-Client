//
//  VTProfileCell.m
//  VTClient
//
//  Created by zijie1016 on 15/10/28.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTProfileCell.h"
#import "VTMineTableViewController.h"
#import "VTLoginViewController.h"

@implementation VTProfileCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.loginButton.hidden = NO;
    self.profileView.hidden = YES;
    
    // 设置登录按钮圆角
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.layer.cornerRadius = 3;
}

- (CGFloat)getHeight
{
    return 100.0;
}


- (IBAction)popLogin:(id)sender
{
    // 模式跳转到登录/注册界面
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *nav = [storyboard instantiateViewControllerWithIdentifier:@"nav"];
    
    [self.tableViewController presentViewController:nav animated:YES completion:nil];
}

@end
