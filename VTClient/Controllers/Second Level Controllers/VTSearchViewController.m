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
#import "VTSearchRecordCell.h"

@interface VTSearchViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic,copy) NSString *plistPath;
@property (nonatomic,strong)NSMutableArray *searchRecords;
@property (nonatomic,strong)NSMutableArray *searchResults;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *searchView;
@property (weak, nonatomic) IBOutlet UITableView *searchRecordView;

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
    [self.searchTextField becomeFirstResponder];
    
    //隐藏searchView,只显示搜索历史searchRecordView
    self.searchView.hidden = YES;
    self.searchRecordView.hidden = NO;
    
    //设置searchView上边距
    self.searchView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    //设置拉伸搜索框背景图片
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
    NSLog(@"initSearch: attempt reading .plist file %@: number of entries (%ld)",self.searchRecords, [self.searchRecords count]);

}

//请求搜索命令后得到的电影
-(void)loadSearchMovies
{
    // 如果没有输入关键，直接搜索placehoder
    NSString *keyWord = [self.searchTextField.text isEqualToString:@""] ? self.searchTextField.placeholder : self.searchTextField.text;
    
    [VTNetworkManager SearchMovieByKeyWord:keyWord andCallback:^(id obj) {
        self.searchResults = obj;
        NSLog(@"----->%@ loadSearchMovies",self.searchResults);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.searchView reloadData];
        });
    }];
}

// 响应手机键盘的return键
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self search];
    
    return YES;
}

#pragma mark - Actions
// 返回首页
- (IBAction)goBack:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

// 搜索按钮响应
- (IBAction)search:(id)sender
{
    [self search];
}

// 实际干活的search方法
- (void)search
{
    // 无论有没有搜索结果，隐藏搜索记录
    self.searchRecordView.hidden = YES;
    
    // 收起小键盘
    [self.searchTextField resignFirstResponder];
    
    self.searchView.hidden = NO;
    self.searchRecordView.hidden = YES;

    [self loadSearchMovies];
    [self saveSearchRecords];
}

// 删除指定位置的单条搜索记录
- (void)deleteRecord:(UIButton *)sender
{
    if(self.searchRecords.count > 0)
    {
        [self.searchRecords removeObjectAtIndex:sender.tag];
        [self.searchRecords writeToFile:self.plistPath atomically:YES];
        [self.searchRecordView reloadData];
    
        NSLog(@"deleted record at index: %ld, number of records left: %ld", sender.tag, self.searchRecords.count);
    }


}

//保存搜索记录
-(void)saveSearchRecords
{
    // 如果没有输入关键，直接搜索placehoder
    NSString *keyWord = [self.searchTextField.text isEqualToString:@""] ? self.searchTextField.placeholder : self.searchTextField.text;

    
    //不保存重复的搜索关键词
    if (![self.searchRecords containsObject:keyWord])
        [self.searchRecords addObject:keyWord];
    
    [self.searchRecords writeToFile:self.plistPath atomically:YES];
    
    NSLog(@"search records saved");
}

//清除搜索记录
- (void)clearSearchRecord
{
    [self.searchRecords removeAllObjects];
    
    [self.searchRecords writeToFile:self.plistPath atomically:YES];
    [self.searchRecordView reloadData];
}

#pragma mark - tableview delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==102)
        return self.searchResults.count;
    else
    {
        NSLog(@"number of rows: %ld", self.searchRecords.count+1);
        // 当没有搜索记录的时候，不显示清空记录按钮
        return self.searchRecords.count>0 ? self.searchRecords.count+1 : self.searchRecords.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 102)
        return 0;
    else
        return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (tableView.tag == 102)
        return 0;
    else
        return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==102)
    {
        // 搜索结果cell
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
        if(indexPath.row < self.searchRecords.count) // 搜索记录cell
        {
            // 搜索记录cell
            static NSString *identifier = @"recordCell";
            VTSearchRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell)
            {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"VTSearchRecordCell" owner:self options:nil] lastObject];
            }
            
            cell.recordLabel.text = [self.searchRecords objectAtIndex:indexPath.row];
            cell.deleteButton.tag = indexPath.row;
            [cell.deleteButton addTarget:self action:@selector(deleteRecord:) forControlEvents:UIControlEventTouchUpInside]; //删除单条记录响应事件
            
            return cell;
        }
        else // 清除历史按钮
        {
            static NSString *identifier = @"clearCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if(!cell)
            {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            
            cell.textLabel.text = @"清除搜索历史";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            
            return cell;
        }
        
        
    }
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==102)
    {
//        PlayViewController *vc = [[PlayViewController alloc] initWithNibName:@"PlayViewController" bundle:nil];
//        vc.movie = [self.searchMovies objectAtIndex:indexPath.row];
//        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        if(indexPath.row < self.searchRecords.count)
        {
            self.searchTextField.text = [self.searchRecords objectAtIndex:indexPath.row];
            [self loadSearchMovies];
            self.searchView.hidden = NO;
            [self.view bringSubviewToFront:self.searchView];
        }
        else
        {
            [self clearSearchRecord];
        }

    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==102) {
        return [self.lwcell getHeight];
    }
    else
        return 42;
}

#pragma mark - Text Field Delegate

// 开始输入的时候隐藏上搜索结果，显示搜索记录
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return [self showSearchRecords];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self showSearchRecords];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return [self showSearchRecords];
}

- (BOOL)showSearchRecords
{
    self.searchView.hidden = YES;
    self.searchRecordView.hidden = NO;
    [self.searchRecordView reloadData];
    
    return YES;
}

@end

