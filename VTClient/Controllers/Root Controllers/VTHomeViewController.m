//
//  VTHomeViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/15.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTHomeViewController.h"

@interface VTHomeViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *navBar;
@property (weak, nonatomic) IBOutlet UIView *searchBG;

@end

@implementation VTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBar];
}

//设置自定义的导航栏
- (void)setupNavBar
{
    
    //设置搜索框View的圆角
    self.searchBG.layer.masksToBounds = YES;
    self.searchBG.layer.cornerRadius = 5;
    
    //设置搜索框text field的代理（self)
    self.searchTextField.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    //隐藏系统导航栏
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    //显示系统导航栏
    //self.navigationController.navigationBarHidden = NO;
}

//serachTextField的delegate方法
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self goToSearch];
    return NO;
}



#pragma mark - Actions

- (IBAction)searchButtonPressed:(id)sender
{
    [self goToSearch];
}


//转到搜索界面
- (void)goToSearch
{
    [self performSegueWithIdentifier:@"searchvc" sender:nil];
}

@end
