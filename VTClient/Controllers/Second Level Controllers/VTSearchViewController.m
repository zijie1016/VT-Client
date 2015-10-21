//
//  VTSearchViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/16.
//  Copyright © 2015年 Test. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>
#import "VTSearchViewController.h"
#import "VTNetworkManager.h"
#import "VTLWideCell.h"

@interface VTSearchViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,copy) NSString *plistPath;
@property (nonatomic,strong)NSMutableArray *searchRecords;
@property (nonatomic,strong)NSMutableArray *searchResults;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *searchView;

@property (nonatomic, strong) VTLWideCell *lwcell;


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
    
    [self initSearch];
}

- (void)initSearch
{
    //隐藏searchView
    self.searchView.hidden = YES;
    
    //设置searchView上边距
    self.searchView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    //设置拉伸搜索框背景图片
    //self.searchField.layer.cornerRadius = 5.0;
    CGFloat top = 5;
    CGFloat bottom = 5;
    CGFloat left = 5;
    CGFloat right = 5;
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *img = [UIImage imageNamed:@"serbox.png"];
    img = [img resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    self.searchTextField.background = img;

    
    //从SerachRecord.plist文件中读取搜索记录
    NSString *document = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    self.plistPath = [document stringByAppendingPathComponent:@"SearchRecord.plist"];
    NSFileManager *file = [NSFileManager defaultManager];
    
    if ([file fileExistsAtPath:self.plistPath])
    {
        NSLog(@"----------------------->>>>>you%@",self.plistPath);
    }
    else //若沙盒中没有,报错
    {
        NSError *error;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"SearchRecord" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath:self.plistPath error:&error];
        
        NSLog(@"写入没有%d",[fileManager copyItemAtPath:bundle toPath:self.plistPath error:&error]);
    }
    
    self.searchRecords = [NSMutableArray arrayWithContentsOfFile:self.plistPath];
    NSLog(@"--->>>>%@ searchRecords",self.searchRecords);

}

//请求搜索命令后得到的电影
-(void)loadSearchMovies
{
    [VTNetworkManager SearchMovieByKeyWord:self.searchTextField.text andCallback:^(id obj) {
        self.searchResults = obj;
        NSLog(@"----->%@ loadSearchMovies",self.searchResults);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.searchView reloadData];
        });
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    //self.navigationController.navigationBarHidden = YES;
}

#pragma mark - Actions

- (IBAction)goBack:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)search:(id)sender
{
    [self.searchTextField resignFirstResponder];
    
    if (![self.searchTextField.text isEqualToString:@""])
    {
        self.searchView.hidden = NO;
//        self.searchRecordview.hidden = YES;
//        self.clearBtn.hidden = YES;
//        self.searchLabel.hidden = YES;
        [self loadSearchMovies];
//        [self saveSearchRecord];
    }

}

#pragma mark - tableview delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==102)
        return self.searchResults.count;
    else
        return self.searchRecords.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==102)
    {
        static NSString *indentifier = @"cell";
        self.lwcell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!self.lwcell)
        {
            self.lwcell = [[[NSBundle mainBundle] loadNibNamed:@"VTLWideCell" owner:self options:nil] lastObject];
        }
        self.lwcell.Hottheatre = [self.searchResults objectAtIndex:indexPath.row];
        return self.lwcell;
        
    }
    else
    {
//        static NSString *indentifier = @"recordCell";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
//        if (!cell)
//        {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
//        }
//        cell.textLabel.text = [self.searchRecords objectAtIndex:indexPath.row];
//        
//        return cell;
        return nil;
    }
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (tableView.tag==102)
//    {
//        PlayViewController *vc = [[PlayViewController alloc] initWithNibName:@"PlayViewController" bundle:nil];
//        vc.movie = [self.searchMovies objectAtIndex:indexPath.row];
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//    else
//    {
//        self.searchTF.text = [self.searchRecords objectAtIndex:indexPath.row];
//        [self loadSearchMovies];
//        self.searchView.hidden = NO;
//        [self.view bringSubviewToFront:self.searchView];
//    }
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==102) {
        return [self.lwcell getHeight];
    }
    else
        return 60;
}


@end
