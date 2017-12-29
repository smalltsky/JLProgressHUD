//
//  JLNoSingleProgressHUD.h
//  JLNoSingleProgressHUD
//
//  Created by 刘奇天 on 2017/12/25.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,JLSizeType)
{
    JLSizeTypeBig = 1 << 0,
    JLSizeTypeSmall = 1 << 1,
    JLSizeTypeNormal = 1 << 2,
};

@interface JLNoSingleColorProgressHUD : UIView

+ (void)showType:(JLSizeType)type toView:(UIView *)view;

+ (void)showType:(JLSizeType)type withLineColor:(NSArray *)lineColor toView:(UIView *)view;
+ (void)showType:(JLSizeType)type withLineWidth:(CGFloat)lineWidth toView:(UIView *)view;

+ (void)showType:(JLSizeType)type withLineColor:(NSArray *)lineColor andLineWidth:(CGFloat)lineWidth toView:(UIView *)view;

+ (void)dismiss;

/**<边框颜色*/
@property (nonatomic, strong) NSArray *lineColor;

/**<边框宽度*/
@property (nonatomic, assign) CGFloat lineWidth;

/**<进度条*/
@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end
