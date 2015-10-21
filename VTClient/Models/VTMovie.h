//
//  VTMovie.h
//  VTClient
//
//  Created by zijie1016 on 15/10/20.
//  Copyright © 2015年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VTMovie : NSObject

@property (nonatomic,copy)NSString *title, *logoName , *logoUrl , *fileName ,*fileUrl, *mainId ,*createDate,*isContinue ,*playCount , *plCount;
@property (nonatomic,copy)NSString *parentId;//视频专辑Id同视频的mainId;
@property (nonatomic,copy)NSString *bsid;//视频Id;

@end
