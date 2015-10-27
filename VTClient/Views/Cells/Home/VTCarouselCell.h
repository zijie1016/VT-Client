//
//  VTCarouselCell.h
//  VTClient
//
//  Created by zijie1016 on 15/10/27.
//  Copyright © 2015年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VTEvent;

@interface VTCarouselCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong)NSMutableArray *topics;
@property (nonatomic, strong)VTEvent *currentEvent;

@property (nonatomic, strong)UINavigationController *navigationController;

- (void)loadData;
- (CGFloat)getHeight;

@end
