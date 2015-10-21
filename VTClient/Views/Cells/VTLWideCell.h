//
//  VTLWideCell.h
//  VTClient
//
//  Created by zijie1016 on 15/10/20.
//  Copyright © 2015年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VTMovie.h"
#import "VTEvent.h"


@interface VTLWideCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgv;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (nonatomic,strong)VTMovie *Hottheatre;
@property (nonatomic,strong)VTEvent *event;

- (CGFloat)getHeight;

@end
