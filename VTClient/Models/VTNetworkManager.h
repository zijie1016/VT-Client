//
//  VTNetworkManager.h
//  VTClient
//
//  Created by zijie1016 on 15/10/20.
//  Copyright © 2015年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void (^Callback)(id obj);

@interface VTNetworkManager : NSObject

//搜索  接口video/search!list.do 参数keyword
+(void)SearchMovieByKeyWord:(NSString *)keyword andCallback:(Callback)callback;

//请求首页热点话题
+(void)requestHotTopicBySubId:(NSString *)SubId andPageSize:(NSString *)pageSize andCallback:(Callback)callback;

@end
