//
//  VTUser.m
//  VTClient
//
//  Created by 汪磊 on 15/10/12.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTUser.h"

@implementation VTUser

+ (VTUser *)userWithGlobalKey:(NSString *)userId
{
    VTUser *curUser = [[VTUser alloc] init];
    curUser.userId = userId;
    
    return curUser;
}

@end
