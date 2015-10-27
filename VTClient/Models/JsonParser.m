//
//  JsonParser.m
//  VTClient
//
//  Created by zijie1016 on 15/10/20.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "JsonParser.h"
#import "VTMovie.h"
#import "VTEvent.h"


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

//解析首页活动
+(VTEvent *)parserEventByDic:(NSDictionary *)dic
{
    VTEvent *event = [[VTEvent alloc] init];
    event.eventName = [dic objectForKey:@"title"];
    event.eventBeginTime = [dic objectForKey:@"beginDate"];
    event.eventEndTiem = [dic objectForKey:@"endDate"];
    event.eventLogoName = [dic objectForKey:@"logoName"];
    event.eventImageUrl = [[dic objectForKey:@"logoUrl"] stringByAppendingString:event.eventLogoName];
    event.mainId = [dic objectForKey:@"infoMainId"];
    event.content = [dic objectForKey:@"content"];
    event.content = [event.content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    event.content = [event.content stringByReplacingOccurrencesOfString:@"</br>" withString:@""];
    event.content = [event.content stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    event.content = [event.content stringByReplacingOccurrencesOfString:@"〈；br〉；" withString:@""];
    event.content = [event.content stringByReplacingOccurrencesOfString:@"<strong>" withString:@""];
    event.content = [event.content stringByReplacingOccurrencesOfString:@"</strong>" withString:@""];
    return event;
}

@end
