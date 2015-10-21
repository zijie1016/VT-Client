//
//  Utility.m
//  VTClient
//
//  Created by zijie1016 on 15/10/20.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "Utility.h"

@implementation Utility

#pragma mark -- 利用正则表达式验证
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [emailTest evaluateWithObject:email];
    
}

+(BOOL)isVAlidateString:(NSString *)myString
{
    NSCharacterSet *nameCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"] invertedSet];
    NSRange userNameRange = [myString rangeOfCharacterFromSet:nameCharacters];
    if (userNameRange.location != NSNotFound)
    {
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}
//通过区分字符串
+(BOOL)validateEmail:(NSString *)email
{
    if((0 != [email rangeOfString:@"@"].length) &&
       0 != [email rangeOfString:@"."].length )
    {
        NSCharacterSet *temInvalidCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        NSMutableCharacterSet *temInvalidaMutableCharSet = [temInvalidaMutableCharSet mutableCopy] ;
        [temInvalidaMutableCharSet removeCharactersInString:@"_-"];
        NSRange range1 = [email rangeOfString:@"@" options:NSCaseInsensitiveSearch];
        //取得用户名部分
        NSString *userNameStr = [email substringToIndex:range1.location];
        NSArray *userNameArr = [userNameStr componentsSeparatedByString:@"."];
        for (NSString *str in userNameArr)
        {
            NSRange rangOfInavlidChars = [str rangeOfCharacterFromSet:temInvalidaMutableCharSet];
            if (rangOfInavlidChars.length != 0 || [str isEqualToString:@""])
            {
                return NO;
            }
        }
        //取得域名部分
        NSString *domainStr = [email substringFromIndex:range1.location+1];
        NSArray *domainArr = [domainStr componentsSeparatedByString:@"."];
        for (NSString *str in domainArr)
        {
            NSRange rangeOfInavlidChars = [str rangeOfCharacterFromSet:temInvalidaMutableCharSet];
            if (rangeOfInavlidChars.length != 0 || [str isEqualToString:@""])
            {
                return NO;
            }
        }
        return YES;
    }
    else
        return NO;
}

+(NSString *)createPostURL:(NSMutableDictionary *)params
{
    NSString *postStr = @"";
    for (NSString *key in [params allKeys])
    {
        NSString *value = [params objectForKey:key];
        postStr = [postStr stringByAppendingFormat:@"%@=%@&",key,value];
    }
    if ([postStr length]>1)
    {
        postStr = [postStr substringToIndex:[postStr length]-1];
    }
    return postStr;
    
}

@end
