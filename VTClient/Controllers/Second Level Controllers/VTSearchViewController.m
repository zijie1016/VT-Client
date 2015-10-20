//
//  VTSearchViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/16.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTSearchViewController.h"

@interface VTSearchViewController ()

@property (nonatomic,copy) NSString *plistPath;
@property (nonatomic,strong)NSMutableArray *searchRecords;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *searchView;


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
    
    //从SerachRecord读取搜索记录
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
    NSLog(@"--->>>>%@",self.searchRecords);

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
//        [self loadSearchMovies];
//        [self saveSearchRecord];
    }

}


@end
