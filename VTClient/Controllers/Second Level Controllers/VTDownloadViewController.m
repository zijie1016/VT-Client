//
//  VTDownloadViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/26.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTDownloadViewController.h"

@interface VTDownloadViewController ()

@property (weak, nonatomic) IBOutlet UIView *downloadingView;
@property (weak, nonatomic) IBOutlet UIView *completedView;

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
    
    // 一开始只显示正在下载页面
    self.downloadingView.hidden = NO;
    self.completedView.hidden = YES;

    // 自定义返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"backt.png"] style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - Actions

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 切换正在下载和已完成界面
- (IBAction)selectView:(UISegmentedControl *)segmentedControl
{
    NSInteger index = segmentedControl.selectedSegmentIndex;
    
    switch (index) {
        case 0:
        {
            self.downloadingView.hidden = NO;
            self.completedView.hidden = YES;
        }
            break;
            
        case 1:
        {
            self.downloadingView.hidden = YES;
            self.completedView.hidden = NO;
        }
            break;
        default:
            break;
    }

}


@end
