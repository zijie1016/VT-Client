//
//  VTWelcomeViewController.m
//  VTClient
//
//  Created by 汪磊 on 15/10/12.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTWelcomeViewController.h"

@interface VTWelcomeViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView * scrollView;

@end

@implementation VTWelcomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self welcome];
}

#pragma mark - 创建欢迎页的滚动视图
-(void)createUIScrollView
{
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = self.view.bounds;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    // ad data
    NSArray * ads = @[@"w1", @"w2", @"w3", @"w4"];
    
    // config scroll view and image views;
    for (int i = 0 ; i < ads.count; i++) {
        UIImage * image = [UIImage imageNamed:ads[i]];
        
        UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
        CGRect frame = self.scrollView.frame;
        frame.origin.x = i * frame.size.width;
        frame.origin.y = 0;
        imageView.frame = frame;
        [self.scrollView addSubview:imageView];
        
        if (i == ads.count - 1) {
            UIButton * next = [UIButton buttonWithType:UIButtonTypeCustom];
            [next addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
            next.frame = imageView.frame;
            [self.scrollView addSubview:next];
        }
    }
    
    CGSize size = self.scrollView.frame.size;
    size.width *= ads.count;
    self.scrollView.contentSize = size;
    self.scrollView.delegate = self;
    
    // config the page control
    UIPageControl * pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 20);
    pageControl.numberOfPages = ads.count;
    pageControl.currentPage = 0;
    pageControl.userInteractionEnabled = NO;
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = round(scrollView.contentOffset.x / scrollView.frame.size.width);
}

- (void)start:(id)sender
{
    UITabBarController * tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"VTMainTabBarController"];
    
    tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:tabBarController animated:YES completion:nil];
    
}

//欢迎界面
-(void)welcome
{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"FirstLoad"])
    {
        //如果是第一次启动 调用引导页
        [self createUIScrollView];
    }
    
    
}

@end
