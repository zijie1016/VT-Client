//
//  VTHomeViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/15.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTHomeViewController.h"
#import "VTDownloadViewController.h"
#import "VTCarouselCell.h"

@interface VTHomeViewController () <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *navBar;


@property (nonatomic, strong)VTCarouselCell *carouselCell;

@end

@implementation VTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBar];
}

//设置自定义的导航栏
- (void)setupNavBar
{
    //设置搜索框text field的代理（self)
    self.searchTextField.delegate = self;
    
    //设置拉伸搜索框背景图片
    CGFloat top = 5;
    CGFloat bottom = 5;
    CGFloat left = 5;
    CGFloat right = 5;
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *img = [UIImage imageNamed:@"serbox_home.png"];
    img = [img resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    self.searchTextField.background = img;

}

- (void)viewDidAppear:(BOOL)animated
{
    //隐藏系统导航栏
    self.navigationController.navigationBarHidden = YES;
}

//serachTextField的delegate方法
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self goToSearch];
    return NO;
}

#pragma mark - UITableView Delegate/Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            return [self.carouselCell getHeight];
        }
            
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath.row: %ld", indexPath.row);
    switch (indexPath.row) {
        case 0:
        {// 轮播图
            NSLog(@"cell 1");
            static NSString *identifier = @"VTCarouselCell";
            self.carouselCell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if(!self.carouselCell)
            {
                self.carouselCell = [[[NSBundle mainBundle]loadNibNamed:@"VTCarouselCell" owner:self options:nil]lastObject];
            }
            
            self.carouselCell.navigationController = self.navigationController;
            //self.carouselCell.scrollView.delegate = self;
            
            return self.carouselCell;
        }
            
            
        default:
            return nil;
    }
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

//转到下载任务界面
- (IBAction)toDownloadList:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VTDownloadViewController *dvc = [storyboard instantiateViewControllerWithIdentifier:@"VTDownloadViewController"];
    [self.navigationController pushViewController:dvc animated:YES];
}


@end
