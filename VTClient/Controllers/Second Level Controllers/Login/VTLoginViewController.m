//
//  VTLoginViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/28.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTLoginViewController.h"
#import "VTSignUpTableViewController.h"
#import "VTMineTableViewController.h"
@interface VTLoginViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *forgotPasswdButton;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIView *inputView;

@end

@implementation VTLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    // “忘记密码”的字体大小
    [self.forgotPasswdButton setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    
    // 设置注册/登录按钮圆角
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.layer.cornerRadius = 3.0;
   
    self.signUpButton.layer.masksToBounds = YES;
    self.signUpButton.layer.cornerRadius = 3.0;
    self.signUpButton.layer.borderWidth = .3;   // 添加边线
    self.signUpButton.layer.borderColor = [UIColor grayColor].CGColor;
}

// 关闭界面
- (IBAction)dismiss:(id)sender
{    
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 跳到注册界面
- (IBAction)toSignUp:(id)sender
{
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    VTSignUpTableViewController *stvc = [storyboard instantiateViewControllerWithIdentifier:@"VTSignUpTableViewController"];
//    [self presentViewController:stvc animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:^{
        

    }];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"step" object:nil];
    
}



@end
