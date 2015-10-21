//
//  VTLWideCell.m
//  VTClient
//
//  Created by zijie1016 on 15/10/20.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTLWideCell.h"
#import <UIImageView+AFNetworking.h>

@implementation VTLWideCell

-(void)layoutSubviews
{
    if (self.Hottheatre)
    {//秀场
        [self.imgv setImageWithURL:[NSURL URLWithString:self.Hottheatre.logoUrl]];
        self.titleLabel.text = self.Hottheatre.title;
        self.timeLabel.text = [[self.Hottheatre.createDate componentsSeparatedByString:@" "] firstObject] ;
    }
    else
    {//自制
        [self.imgv setImageWithURL:[NSURL URLWithString:self.event.eventImageUrl]];
        self.titleLabel.text = self.event.eventName;
        self.timeLabel.text = [[self.event.eventBeginTime componentsSeparatedByString:@" "] firstObject];
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}


- (CGFloat)getHeight
{
    //动态计算cell高度
    CGFloat h = ([UIScreen mainScreen].bounds.size.width-10)*77/152;
    
    return h + 66;
}

@end
