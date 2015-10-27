//
//  VTCarouselCell.m
//  VTClient
//
//  Created by zijie1016 on 15/10/27.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTCarouselCell.h"
#import "Global.h"
#import "VTEvent.h"
#import <UIImageView+AFNetworking.h>
#import "VTNetworkManager.h"
#import "VTEventDetailViewController.h"


@interface VTCarouselCell () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation VTCarouselCell

- (CGFloat)getHeight
{
    //决定Cell高度时保持比例（32:15)
    return kScreenWidth * 15 / 32;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self loadData];
}

- (void)createView
{
     // 设置scrollView属性
    self.scrollView.contentSize =CGSizeMake(kScreenWidth*self.topics.count, [self getHeight]);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces =NO;
    self.scrollView.delegate = self;
    
    //载入图片
    for(int i = 0 ; i < self.topics.count ; i++)
    {
        self.currentEvent = [self.topics objectAtIndex:i];
        self.titleLabel.text = self.currentEvent.eventName;
        NSLog(@"%@",self.titleLabel.text);
        //UIImageView显示图片
        UIImageView *imgView = [[UIImageView alloc] init];
        NSString *imgStr = self.currentEvent.eventImageUrl;
        [imgView setImageWithURL:[NSURL URLWithString:imgStr]];
        //设置每一个imgView的frame
        imgView.frame = CGRectMake(kScreenWidth*i , 0,kScreenWidth, [self getHeight]);
        //把imgView添加到scrollView上
        [self.scrollView addSubview:imgView];
        self.scrollView.userInteractionEnabled = YES;
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stepTo:)];
        [imgView addGestureRecognizer:tap];
    }

}

-(void)updatePage
{
    //设置有多少页码
    self.pageControl.numberOfPages = self.topics.count;
    //设置当前页码
    self.pageControl.currentPage = 0;
    //循环的滚动
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changedImage) userInfo:nil repeats:YES];
}

-(void)stepTo:(UITapGestureRecognizer *)sender
{
    NSLog(@"-----------点我-----点我------");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VTEventDetailViewController *edvc = [storyboard instantiateViewControllerWithIdentifier:@"VTEventDetailViewController"];
    //edvc.event = self.currentEvent;
    [self.navigationController pushViewController:edvc animated:YES];

}

//从服务器请求数据
-(void)loadData
{
    [VTNetworkManager requestHotTopicBySubId:@"2014082100065367081" andPageSize:@"5" andCallback:^(id obj) {
        self.topics = obj;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self createView];
            [self updatePage];
            //[self.myTV reloadData];
        });
    }];
    
}

//隔一段时间更新图片
-(void)changedImage
{
    //声明一个CGPoint结构体  contentOffset
    CGPoint point = self.scrollView.contentOffset;
    //设置布尔类型的值
    static BOOL isEnd = YES;
    //判断
    if(isEnd)
    {
        point.x+=kScreenWidth;
        
    }
    else
    {
        point.x=0;
    }
    //让滚动视图动起来
    [self.scrollView setContentOffset:point animated:YES];
    //更新页面控制器上的页码
    self.pageControl.currentPage = (int)(point.x/kScreenWidth);
    //循环滚动 滚回来
    if(kScreenWidth *(self.topics.count-1) <= point.x)
    {
        //到头了  右侧  NO
        isEnd = NO;
        // point.x--;
        point.x=0;
    }
    else if(0 == point.x)
    {
        //从头滚动   左侧 YES
        isEnd = YES;
    }
    _currentEvent = [self.topics objectAtIndex:self.pageControl.currentPage];
    self.titleLabel.text = _currentEvent.eventName;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stepTo:)];
    UIImageView *imageView = [self.scrollView.subviews objectAtIndex:self.pageControl.currentPage+1];
    [imageView addGestureRecognizer:tap];
    
}


#pragma mark - UIScrollView Delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = scrollView.contentOffset.x/kScreenWidth;
    _currentEvent = [self.topics objectAtIndex:self.pageControl.currentPage];
    self.titleLabel.text = _currentEvent.eventName;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stepTo:)];
    UIImageView *imageView = [self.scrollView.subviews objectAtIndex:self.pageControl.currentPage+1];
    [imageView addGestureRecognizer:tap];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //告知一个BOOL类型的值，告诉你滚动视图最后的位置前，是否需要减速。
    decelerate = YES;
}

@end
