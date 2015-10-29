//
//  VTMineTableViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/15.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTMineTableViewController.h"
#import "VTProfileCell.h"
#import "VTSignUpTableViewController.h"
@interface VTMineTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)VTProfileCell *profileCell;

@end

@implementation VTMineTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stepTo:) name:@"step" object:nil];
}

-(void)stepTo:(NSNotification *)notif
{
    NSLog(@"-----------");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *vc = [storyboard instantiateViewControllerWithIdentifier:@"navsignup"];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            return [self.profileCell getHeight];
        }
        
        case 1:
        case 2:
        {
            return 40;
        }
            
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    static NSString *identifier = @"VTProfileCell";
                    self.profileCell = [tableView dequeueReusableCellWithIdentifier:identifier];
                    if(!self.profileCell)
                    {
                        self.profileCell = [[[NSBundle mainBundle]loadNibNamed:@"VTProfileCell" owner:self options:nil]lastObject];
                    }
                    self.profileCell.delegate = self;
                    return self.profileCell;
                }
                    
                    
                default:
                    break;
            }
        }
            
            
        default:
            break;
    }

    
    return nil;
}



@end
