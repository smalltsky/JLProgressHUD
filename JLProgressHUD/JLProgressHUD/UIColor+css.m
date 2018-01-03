//
//  UIColor+css.m
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/9.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import "UIColor+css.h"

@implementation UIColor (css)

+(UIColor *)colorWithCss:(NSNumber *)css
{
    return [UIColor colorWithRed:((float)((css.intValue & 0xFF0000) >> 16))/255.0 green:((float)((css.intValue & 0xFF00) >> 8))/255.0 blue:((float)(css.intValue & 0xFF))/255.0 alpha:1.0];
}

+(UIColor *)colorWithCss:(NSNumber *)css alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((css.intValue & 0xFF0000) >> 16))/255.0 green:((float)((css.intValue & 0xFF00) >> 8))/255.0 blue:((float)(css.intValue & 0xFF))/255.0 alpha:alpha];
}

@end
