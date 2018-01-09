//
//  JLGifAnimatedView.m
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/9.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import "JLGifAnimatedView.h"
#import "UIImage+gif.h"

@implementation JLGifAnimatedView

- (instancetype)initWithGifImageData:(NSData *)data
{
    if (self = [super init])
    {
        UIImage * image = [UIImage imageWithGifData:data];
        self.image = image;
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return self;
}
- (instancetype)initWithGifImageFilePath:(NSString *)filePath
{
    if (self = [super init])
    {
        NSData * data = [NSData dataWithContentsOfFile:filePath];
        self.image = [UIImage imageWithGifData:data];
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return self;
}
- (instancetype)initWithGifImageName:(NSString *)imageName
{
    if (self = [super init])
    {
        self.image = [UIImage imageWithGifNamed:imageName];
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return self;
}

@end
