//
//  JsonParser.h
//  VTClient
//
//  Created by zijie1016 on 15/10/20.
//  Copyright © 2015年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VTEvent;
@class VTMovie;

@interface JsonParser : NSObject

+(VTMovie *)paraserMovieByDic:(NSDictionary *)dic;
+(VTEvent *)parserEventByDic:(NSDictionary *)dic;
@end
