//
//  UIColor+css.m
//  KJCF
//
//  Created by KuaiJie on 2017/12/9.
//  Copyright © 2017年 KuaiJie. All rights reserved.
//

#import "UIColor+css.h"

@implementation UIColor (css)

+(UIColor *)colorWithCss:(NSNumber *)css
{
    return [UIColor colorWithRed:((float)((css.intValue & 0xFF0000) >> 16))/255.0 green:((float)((css.intValue & 0xFF00) >> 8))/255.0 blue:((float)(css.intValue & 0xFF))/255.0 alpha:1.0];
}

@end
