//
//  JLProgressHUD.h
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/25.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,JLProgressHUDStandardWidthType)
{
    JLProgressHUDStandardWidthTypeNormal = 1 << 0,
    JLProgressHUDStandardWidthTypeSmall = 1 << 1,
};

typedef NS_ENUM(NSInteger,JLProgressHUDType)
{
    JLProgressHUDTypeNormal = 1 << 0,
    JLProgressHUDTypeProgress = 1 << 1,
    JLProgressHUDTypeImage = 1 << 2,
    JLProgressHUDTypeGifImage = 1 << 3,
    JLProgressHUDTypeAnimation = 1 << 4,
};

typedef  NS_ENUM(NSInteger,JLProgressHUDAnimationType)
{
    JLProgressHUDAnimationTypeNormal = 1 << 0,
    JLProgressHUDAnimationTypeSuccess = 1 << 1,
    JLProgressHUDAnimationTypeFailure = 1 << 2,
    JLProgressHUDAnimationTypeInfo = 1 << 3,
    
};

typedef NS_ENUM(NSInteger,JLProgressHUDNormalColorType)
{
    JLProgressHUDNormalColorTypeColor = 1 << 0,
    JLProgressHUDNormalColorTypeWhite = 1 << 1,
    JLProgressHUDNormalColorTypeBlack = 1 << 2,
};

typedef NS_ENUM(NSInteger,JLProgressHUDStyleType)
{
    JLProgressHUDStyleTypeWhite = 1 << 0,
    JLProgressHUDStyleTypeBlack = 1 << 1,
};

@interface JLProgressHUD : UIView

+ (JLProgressHUD *)sharedView;

-(void)setColorType:(JLProgressHUDNormalColorType)colorType;

-(void)setStyleType:(JLProgressHUDStyleType)styleType;

-(void)setStandardWidthType:(JLProgressHUDStandardWidthType)standardWidthType;

-(void)setStatusFont:(UIFont *)statusFont;

-(void)setAllProgressColor:(UIColor *)allProgressColor;
-(void)setNoAllProgressColor:(UIColor *)noAllProgressColor;

-(void)setImageViewSize:(CGSize)imageViewSize;

-(void)setOffSetY:(CGFloat)offSetY;

-(void)setAnimationInfoColor:(UIColor *)animationInfoColor;
-(void)setAnimationSpinnerColor:(UIColor *)animationSpinnerColor;

-(void)setColors:(NSArray *)colors;

+ (void)showWithStatus:(NSString*)status;

+ (void)showInfoWithStatus:(NSString *)status;
+ (void)showSuccessWithStatus:(NSString *)status;
+ (void)showFailureWithStatus:(NSString *)status;

+ (void)showAnimationWithStatus:(NSString*)status;

+ (void)showAnimationInfoWithStatus:(NSString *)status animated:(BOOL)animated;
+ (void)showAnimationSuccessWithStatus:(NSString *)status animated:(BOOL)animated;
+ (void)showAnimationFailureWithStatus:(NSString *)status animated:(BOOL)animated;

+ (void)showWithImage:(UIImage *)image Status:(NSString *)status;
+ (void)showWithGifImageName:(NSString *)name Status:(NSString *)status;
+ (void)showWithProgress:(NSNumber *)progress Status:(NSString *)status;

+ (void)showProgress:(JLProgressHUDType)type status:(NSString *)status Progress:(NSNumber *)progress image:(UIImage *)image;

- (void)showProgress:(JLProgressHUDType)type status:(NSString *)status Progress:(NSNumber *)progress image:(UIImage *)image;

+ (void)dismiss;
+ (void)dismissWithDelay:(NSTimeInterval)delay;

- (void)dismiss;
- (void)dismissWithDelay:(NSTimeInterval)delay;

@end
