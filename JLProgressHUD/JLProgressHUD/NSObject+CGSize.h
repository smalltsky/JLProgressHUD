//
//  NSObject+CGSize.h
//  JLProgressHUD
//
//  Created by smalltsky on 2017/11/22.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (CGSize)

//根据数字的多少确定宽度 高度固定
+(CGSize)adaptiveText:(NSString *)showString  showHeight:(CGFloat)heightMax fontSize:(UIFont *)font;
//根据数字的多少确定高度 宽度固定
+(CGSize)adaptiveText:(NSString *)showString  showWidth:(CGFloat)widthMax fontSize:(UIFont *)font;

@end
