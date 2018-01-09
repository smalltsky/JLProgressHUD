//
//  NSObject+CGSize.m
//  JLProgressHUD
//
//  Created by smalltsky on 2017/11/22.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import "NSObject+CGSize.h"

@implementation NSObject (CGSize)

#pragma mark 根据数字的多少确定宽度 高度固定

+ (CGSize)adaptiveText:(NSString *)showString  showHeight:(CGFloat)heightMax fontSize:(UIFont *)font
{
    CGSize ret;
    
    NSDictionary *attribus = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    NSLog(@"%@",showString);
    CGRect bounds = [showString boundingRectWithSize:CGSizeMake(MAXFLOAT,heightMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribus context:nil];//MAXFLOAT不限制宽度
    
    ret = bounds.size;
    
    return ret;
}

#pragma mark 根据数字的多少确定高度 宽度固定

+ (CGSize)adaptiveText:(NSString *)showString  showWidth:(CGFloat)widthMax fontSize:(UIFont *)font
{
    CGSize ret;
    
    NSDictionary *attribus = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    
    CGRect bounds = [showString boundingRectWithSize:CGSizeMake(widthMax,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribus context:nil];//MAXFLOAT不限制宽度
    
    ret = bounds.size;
    
    return ret;
}

@end
