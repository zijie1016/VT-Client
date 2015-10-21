//
//  JsonParser.m
//  VTClient
//
//  Created by zijie1016 on 15/10/20.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "JsonParser.h"

@implementation JsonParser

//解析电影
+(VTMovie *)paraserMovieByDic:(NSDictionary *)dic
{
    VTMovie *movie = [[VTMovie alloc] init];
    movie.title = [dic objectForKey:@"title"];
    movie.logoName = [dic objectForKey:@"logoName"];
    movie.logoUrl = [[dic objectForKey:@"logoUrl"] stringByAppendingString:movie.logoName];
    movie.fileName = [dic objectForKey:@"fileName"];
    movie.fileUrl = [[dic objectForKey:@"fileUrl"] stringByAppendingString:movie.fileName];
    movie.mainId = [dic objectForKey:@"infoMainId"];
    movie.isContinue =[dic objectForKey:@"isContinue"];//是否是连续剧 0：不是 1：是
    movie.parentId = [dic objectForKey:@"parentId"];
    movie.bsid = [dic objectForKey:@"id"];
    movie.playCount = [dic objectForKey:@"playCount"];
    movie.plCount = [dic objectForKey:@"plCount"];
    movie.createDate = [dic objectForKey:@"createDate"];
    return movie;
    
}


@end
