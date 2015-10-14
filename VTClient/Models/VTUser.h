//
//  VTUser.h
//  VTClient
//
//  Created by 汪磊 on 15/10/12.
//  Copyright © 2015年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VTUser : NSObject

@property (nonatomic,strong)NSString *curPassword, *resetPassword;
@property (nonatomic,strong)NSString *userName, *userNotes, *logoUrl , *userSex, *userId ,*logoName, *errorCode, *errorMessage, *userBirthday ,*userAddress , *userPhone;
+ (VTUser *)userWithGlobalKey:(NSString *)userId;

@end
