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

//默认 为黑色
@property (nonatomic,assign) JLProgressHUDNormalColorType colorType;
//默认 为白色
@property (nonatomic,assign) JLProgressHUDStyleType styleType;
//默认 JLProgressHUDStandardWidthTypeNormal
@property (nonatomic,assign) JLProgressHUDStandardWidthType standardWidthType;
//默认 为14.0
@property (nonatomic,strong) UIFont *statusFont;
//默认 为灰色 只有JLProgressHUDType类型为JLProgressHUDTypeProgress时有用
@property (nonatomic,strong) UIColor *allProgressColor;
//默认 为红色 只有JLProgressHUDType类型为JLProgressHUDTypeProgress时有用
@property (nonatomic,strong) UIColor *noAllProgressColor;

//默认 为27x27
@property (nonatomic,assign) CGSize imageViewSize UI_APPEARANCE_SELECTOR;

+ (JLProgressHUD *)sharedView;

+ (void)showWithStatus:(NSString*)status;

+ (void)showInfoWithStatus:(NSString *)status;
+ (void)showSuccessWithStatus:(NSString *)status;
+ (void)showFailureWithStatus:(NSString *)status;

+ (void)showWithImage:(UIImage *)image Status:(NSString *)status;
+ (void)showWithProgress:(NSNumber *)progress Status:(NSString *)status;

+ (void)showProgress:(JLProgressHUDType)type status:(NSString *)status colors:(NSArray *)colors Progress:(NSNumber *)progress image:(UIImage *)image;

- (void)showProgress:(JLProgressHUDType)type status:(NSString *)status colors:(NSArray *)colors Progress:(NSNumber *)progress image:(UIImage *)image;

+ (void)dismiss;
+ (void)dismissWithDelay:(NSTimeInterval)delay;

- (void)dismiss;
- (void)dismissWithDelay:(NSTimeInterval)delay;

@end
