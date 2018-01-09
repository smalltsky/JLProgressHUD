//
//  UIImage+gif.m
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/9.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import "UIImage+gif.h"

@implementation UIImage (gif)

+ (UIImage *)imageWithGifData:(NSData *)data
{
    if (!data)
    {
        return nil;
    }
    
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    size_t frameCount = CGImageSourceGetCount(source);
    UIImage *animatedImage;
    if (frameCount <= 1)
    {
        animatedImage = [[UIImage alloc] initWithData:data];
    }
    else
    {
        NSMutableArray *images = [NSMutableArray array];
        NSTimeInterval duration = 0.0f;
        for (size_t i = 0; i < frameCount; i++)
        {
            CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
            
            if (!image)
            {
                continue;
            }
            
            duration += [self getDurationWithIndex:i source:source];
            [images addObject:[UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
            CGImageRelease(image);
        }
        
        if (!duration)
        {
            duration = (1.0f / 10.0f) * frameCount;
        }
        
        animatedImage = [UIImage animatedImageWithImages:images duration:duration];
    }
    
    CFRelease(source);
    
    return animatedImage;
}

+ (float)getDurationWithIndex:(NSUInteger)index source:(CGImageSourceRef)source
{
    float frameDuration = 0.1f;
    CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil);
    NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
    NSDictionary *gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    
    NSNumber *delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    
    if (delayTimeUnclampedProp)
    {
        frameDuration = [delayTimeUnclampedProp floatValue];
    }
    else
    {
        NSNumber *delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        if (delayTimeProp)
        {
            frameDuration = [delayTimeProp floatValue];
        }
    }
    if (frameDuration < 0.011f)
    {
        frameDuration = 0.100f;
    }
    
    CFRelease(cfFrameProperties);
    return frameDuration;
}

+ (UIImage *)imageWithGifNamed:(NSString *)name
{
    CGFloat scale = [UIScreen mainScreen].scale;
    if (scale > 1.0f)
    {
        NSString *retinaPath = [[NSBundle mainBundle] pathForResource:[name stringByAppendingString:@"@2x"] ofType:@"gif"];
        
        NSData *data = [NSData dataWithContentsOfFile:retinaPath];
        
        if (data)
        {
            return [UIImage imageWithGifData:data];
        }
        
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"gif"];
        data = [NSData dataWithContentsOfFile:path];
        
        if (data)
        {
            return [UIImage imageWithGifData:data];
        }
        
        return [UIImage imageNamed:name];
    }
    else
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"gif"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        if (data)
        {
            return [UIImage imageWithGifData:data];
        }
        
        return [UIImage imageNamed:name];
    }
}

@end
