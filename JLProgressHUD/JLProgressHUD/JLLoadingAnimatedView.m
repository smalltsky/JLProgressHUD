//
//  JLLoadingAnimatedView.m
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/29.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import "JLLoadingAnimatedView.h"
#import "UIColor+css.h"

@implementation JLLoadingAnimatedView

+ (instancetype)showType:(JLJLLoadingAnimatedViewSizeType)type toView:(UIView *)view
{
    return [self showType:type withLineColor:nil andLineWidth:3.0 toView:view];
}
+ (instancetype)showType:(JLJLLoadingAnimatedViewSizeType)type withLineColor:(NSArray *)lineColor toView:(UIView *)view
{
   return [self showType:type withLineColor:lineColor andLineWidth:3.0 toView:view];
}

+ (instancetype)showType:(JLJLLoadingAnimatedViewSizeType)type withLineWidth:(CGFloat)lineWidth toView:(UIView *)view
{
   return [self showType:type withLineColor:nil andLineWidth:lineWidth toView:view];
}

+ (instancetype)showType:(JLJLLoadingAnimatedViewSizeType)type withLineColor:(NSArray *)lineColor andLineWidth:(CGFloat)lineWidth toView:(UIView *)view
{
    return [[JLLoadingAnimatedView sharedViewAndType:type] showType:type withLineColor:lineColor andLineWidth:lineWidth toView:view];
}

+ (void)dismiss
{
    [self dismissWithDelay:0.0];
}

+ (void)dismissWithDelay:(NSTimeInterval)delay
{
    [[self sharedViewAndType:JLJLLoadingAnimatedViewSizeTypeNormal] dismissWithDelay:delay];
}

+ (JLLoadingAnimatedView *)sharedViewAndType:(JLJLLoadingAnimatedViewSizeType)type
{
    return [[self alloc] initWithSizeType:type];
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static JLLoadingAnimatedView *toolAudio;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        toolAudio = [super allocWithZone:zone];
                      
    });
    
    return toolAudio;
}

- (instancetype)initWithSizeType:(JLJLLoadingAnimatedViewSizeType)type
{
    NSCAssert(type, @"必须传type");
    CGRect rect = CGRectMake(0, 0, 0, 0);
    if (type == JLJLLoadingAnimatedViewSizeTypeNormal)
    {
        rect = CGRectMake(0, 0, 60, 60);
    }
    
    if (type == JLJLLoadingAnimatedViewSizeTypeSmall)
    {
        rect = CGRectMake(0, 0, 40, 40);
    }
    
    if (type == JLJLLoadingAnimatedViewSizeTypeBig)
    {
        rect = CGRectMake(0, 0, 80, 80);
    }
    
    return [self initWithFrame:rect];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame
                  andLineWidth:3.0
                  andLineColor:@[[UIColor colorWithRed:62/255.0 green:155/255.0 blue:234/255.0 alpha:1.0],[UIColor redColor],[UIColor colorWithRed:62/255.0 green:155/255.0 blue:234/255.0 alpha:1.0],[UIColor redColor],[UIColor colorWithRed:62/255.0 green:155/255.0 blue:234/255.0 alpha:1.0],[UIColor redColor]]];
}

- (instancetype)initWithFrame:(CGRect)frame andLineWidth:(CGFloat)lineWidth andLineColor:(NSArray *)lineColor
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.lineWidth = lineWidth;
        self.lineColor = lineColor;
    }
    
    return self;
}

- (void)setup
{
    NSAssert(self.lineWidth > 0.0, @"lineWidth must great than zero");
    NSAssert(self.lineColor.count > 0, @"lineColor must set");
    
    
    //外层旋转动画
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = @0.0;
    rotationAnimation.toValue = @(2*M_PI);
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.duration = 3.0;
    rotationAnimation.beginTime = 0.0;
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    //内层进度条动画
    CABasicAnimation *strokeAnim1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnim1.fromValue = @0.0;
    strokeAnim1.toValue = @1.0;
    strokeAnim1.duration = 1.0;
    strokeAnim1.beginTime = 0.0;
    strokeAnim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    //内层进度条动画
    CABasicAnimation *strokeAnim2 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeAnim2.fromValue = @0.0;
    strokeAnim2.toValue = @1.0;
    strokeAnim2.duration = 1.0;
    strokeAnim2.beginTime = 1.0;
    strokeAnim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.duration = 2.0;
    animGroup.repeatCount = HUGE_VALF;
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.animations = @[strokeAnim1, strokeAnim2];
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.lineWidth, self.lineWidth, CGRectGetWidth(self.frame)-self.lineWidth*2, CGRectGetHeight(self.frame)-self.lineWidth*2)];
    
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.lineWidth = self.lineWidth;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.strokeColor = ((UIColor *)self.lineColor[0]).CGColor;
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeStart = 0.0;
    self.progressLayer.strokeEnd = 1.0;
    self.progressLayer.path = path.CGPath;
    [self.progressLayer addAnimation:animGroup forKey:@"strokeAnim"];
    
    [self.layer addSublayer:self.progressLayer];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(randomColor)
                                   userInfo:nil
                                    repeats:YES];
    
}

- (void)randomColor
{
    UIColor *color = (UIColor *)[self.lineColor objectAtIndex:arc4random()%self.lineColor.count];
    self.progressLayer.strokeColor = color.CGColor;
}

- (void)dismiss
{
    [self dismissWithDelay:0.0];
}

- (void)dismissWithDelay:(NSTimeInterval)delay
{
    [UIView animateWithDuration:delay animations:^
     {
         self.alpha = 0;
         self.hidden = YES;
     } completion:^(BOOL finished)
     {
         [self removeFromSuperview];
     }];
}

- (instancetype)showType:(JLJLLoadingAnimatedViewSizeType)type withLineColor:(NSArray *)lineColor andLineWidth:(CGFloat)lineWidth toView:(UIView *)view
{
    __weak JLLoadingAnimatedView * weakSelf = self;
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^
     {
         __strong JLLoadingAnimatedView *strongSelf = weakSelf;
         
         if (strongSelf)
         {
             if (lineColor)
             {
                 strongSelf.lineColor = lineColor;
             }
             
             if (lineWidth)
             {
                 strongSelf.lineWidth = lineWidth;
             }
             
             if (view.frame.size.width == [UIScreen mainScreen].bounds.size.width && view.frame.size.height == [UIScreen mainScreen].bounds.size.height)
             {
                 strongSelf.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
             }
             else if (view.frame.size.width == [UIScreen mainScreen].bounds.size.width)
             {
                 strongSelf.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,view.frame.size.height/2);
             }
             else if (view.frame.size.height == [UIScreen mainScreen].bounds.size.height)
             {
                 strongSelf.center = CGPointMake(view.frame.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
             }
             else
             {
                 strongSelf.center = CGPointMake(view.frame.size.width/2,view.frame.size.height/2-10);
             }
             
             [strongSelf setup];
             [view addSubview:strongSelf];
         }
     }];
    
    return weakSelf;
}

@end
