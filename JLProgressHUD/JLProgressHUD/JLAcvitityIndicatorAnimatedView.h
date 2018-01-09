//
//  JLAcvitityIndicatorAnimated.h
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/29.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,JLAcvitityIndicatorAnimatedType)
{
    JLAcvitityIndicatorAnimatedTypeNormal = 1 << 0,
    JLAcvitityIndicatorAnimatedTypeSmall = 1 << 1,
};

@interface JLAcvitityIndicatorAnimatedView : UIView

- (instancetype)initWithType:(JLAcvitityIndicatorAnimatedType)type;

@property (nonatomic,assign) CGFloat padding;

@property (strong,nonatomic) UIColor *spinnerColor;

@property (strong,nonatomic) UIColor *infoColor;

- (void)startAnimating;

- (void)stopAnimate;

- (void)updateToSuccess:(BOOL)animated;

- (void)updateToFail:(BOOL)animated;

- (void)updateToInfo:(BOOL)animated;

@end
