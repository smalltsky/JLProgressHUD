//
//  UIImage+gif.h
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/9.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (gif)

+ (UIImage *)imageWithGifNamed:(NSString *)name;

+ (UIImage *)imageWithGifData:(NSData *)data;

@end
