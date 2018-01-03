//
//  UIColor+css.h
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/9.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (css)

+(UIColor *)colorWithCss:(NSNumber *)css;

+(UIColor *)colorWithCss:(NSNumber *)css alpha:(CGFloat)alpha;

@end
