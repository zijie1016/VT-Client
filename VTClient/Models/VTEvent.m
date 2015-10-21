//
//  VTEvent.m
//  VTClient
//
//  Created by zijie1016 on 15/10/21.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTEvent.h"

@implementation VTEvent

-(float)getEventContentHeight
{
    float height = 0;
    float width = 300;
    CGRect frame = [self.content boundingRectWithSize:CGSizeMake(width, 999) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
    
    height += frame.size.height;
    
    return height;
}


@end
