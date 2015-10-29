//
//  VTProfileCell.h
//  VTClient
//
//  Created by zijie1016 on 15/10/28.
//  Copyright © 2015年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VTMineTableViewController;

@interface VTProfileCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *profileView;

@property (weak, nonatomic) VTMineTableViewController *tableViewController;

- (CGFloat)getHeight;

@end
