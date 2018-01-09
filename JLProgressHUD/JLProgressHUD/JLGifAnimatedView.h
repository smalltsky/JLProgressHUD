//
//  JLGifAnimatedView.h
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/9.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLGifAnimatedView : UIImageView

- (instancetype)initWithGifImageName:(NSString *)imageName;

- (instancetype)initWithGifImageFilePath:(NSString *)filePath;

- (instancetype)initWithGifImageData:(NSData *)data;

@end
