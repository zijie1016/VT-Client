//
//  JsonParser.h
//  VTClient
//
//  Created by zijie1016 on 15/10/20.
//  Copyright © 2015年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VTMovie.h"

@interface JsonParser : NSObject

+(VTMovie *)paraserMovieByDic:(NSDictionary *)dic;

@end
