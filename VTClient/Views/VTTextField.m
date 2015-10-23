//
//  VTTextField.m
//  VTClient
//
//  Created by zijie1016 on 15/10/22.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTTextField.h"

@implementation VTTextField

// Placeholder矩形框尺寸和位置
- (CGRect)textRectForBounds:(CGRect)bounds
{
    
    CGRect rect = [super textRectForBounds:bounds];
    
    
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0,25, 0, 0);
    
    return UIEdgeInsetsInsetRect(rect, insets);
    
}


// 输入文本矩形框尺寸和位置
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect rect = [super editingRectForBounds:bounds];
    
    
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0,25, 0, 0);
    
    return UIEdgeInsetsInsetRect(rect, insets);
    
}


// Clear button矩形框尺寸和位置
//- (CGRect)clearButtonRectForBounds:(CGRect)bounds
//{
//    
//    CGRect rect = [super clearButtonRectForBounds:bounds];
//    
//    
//    
//    return CGRectOffset(rect,0, -5);
//    
//}

@end
