//
//  JLLoadingAnimatedView.h
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/29.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,JLJLLoadingAnimatedViewSizeType)
{
    JLJLLoadingAnimatedViewSizeTypeNormal = 1 << 0,
    JLJLLoadingAnimatedViewSizeTypeSmall = 1 << 1,
    JLJLLoadingAnimatedViewSizeTypeBig = 1 << 2,
};

@interface JLLoadingAnimatedView : UIView

+ (instancetype)showType:(JLJLLoadingAnimatedViewSizeType)type toView:(UIView *)view;

+ (instancetype)showType:(JLJLLoadingAnimatedViewSizeType)type withLineColor:(NSArray *)lineColor toView:(UIView *)view;
+ (instancetype)showType:(JLJLLoadingAnimatedViewSizeType)type withLineWidth:(CGFloat)lineWidth toView:(UIView *)view;

+ (instancetype)showType:(JLJLLoadingAnimatedViewSizeType)type withLineColor:(NSArray *)lineColor andLineWidth:(CGFloat)lineWidth toView:(UIView *)view;

+ (void)dismiss;

/**<边框颜色*/
@property (nonatomic, strong) NSArray *lineColor;

/**<边框宽度*/
@property (nonatomic, assign) CGFloat lineWidth;

/**<进度条*/
@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end
