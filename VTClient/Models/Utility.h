//
//  Utility.h
//  VTClient
//
//  Created by zijie1016 on 15/10/20.
//  Copyright © 2015年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+(BOOL)isValidateEmail:(NSString *)email;
+(BOOL)validateEmail:(NSString *)email;
+(BOOL)isVAlidateString:(NSString *)myString;
+(NSString *)createPostURL:(NSMutableDictionary *)params;


@end
