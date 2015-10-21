//
//  VTEvent.h
//  VTClient
//
//  Created by zijie1016 on 15/10/21.
//  Copyright © 2015年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VTEvent : NSObject

@property (nonatomic,copy)NSString *eventBeginTime , *eventEndTiem, *eventIntro, *eventName, *eventImageUrl, *eventLogoName, *mainId,*flieName, *fileUrl, *content;

-(float)getEventContentHeight;

@end
