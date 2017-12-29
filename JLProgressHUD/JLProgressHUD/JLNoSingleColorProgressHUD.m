//
//  JLNoSingleProgressHUD.m
//  JLNoSingleProgressHUD
//
//  Created by 刘奇天 on 2017/12/25.
//

#import "JLNoSingleColorProgressHUD.h"

@interface JLNoSingleColorProgressHUD ()

@end

@implementation JLNoSingleColorProgressHUD

+ (void)showType:(JLSizeType)type toView:(UIView *)view
{
    [self showType:type withLineColor:nil andLineWidth:3.0 toView:view];
}
+ (void)showType:(JLSizeType)type withLineColor:(NSArray *)lineColor toView:(UIView *)view
{
    [self showType:type withLineColor:lineColor andLineWidth:3.0 toView:view];
}

+ (void)showType:(JLSizeType)type withLineWidth:(CGFloat)lineWidth toView:(UIView *)view
{
    [self showType:type withLineColor:nil andLineWidth:lineWidth toView:view];
}

+ (void)showType:(JLSizeType)type withLineColor:(NSArray *)lineColor andLineWidth:(CGFloat)lineWidth toView:(UIView *)view
{
    [[JLNoSingleColorProgressHUD sharedViewAndType:type] showType:type withLineColor:lineColor andLineWidth:lineWidth toView:view];
}

+ (void)dismiss
{
    [self dismissWithDelay:0.0];
}

+ (void)dismissWithDelay:(NSTimeInterval)delay
{
    [[self sharedViewAndType:JLSizeTypeNormal] dismissWithDelay:delay];
}

+ (JLNoSingleColorProgressHUD *)sharedViewAndType:(JLSizeType)type
{
    return [[self alloc] initWithSizeType:type];
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static JLNoSingleColorProgressHUD *toolAudio;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        
        toolAudio = [super allocWithZone:zone];
        
    });
    
    return toolAudio;
}

- (instancetype)initWithSizeType:(JLSizeType)type
{
    NSCAssert(type, @"必须传type");
    if (type == JLSizeTypeBig)
    {
        return [self initWithFrame:CGRectMake(0, 0, 80, 80)];
    }
    else if (type == JLSizeTypeNormal)
    {
        return [self initWithFrame:CGRectMake(0, 0, 60, 60)];
    }
    else if (type == JLSizeTypeSmall)
    {
        return [self initWithFrame:CGRectMake(0, 0, 40, 40)];
    }
    else
    {
        return nil;
    }
    
    return nil;
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

- (void)showType:(JLSizeType)type withLineColor:(NSArray *)lineColor andLineWidth:(CGFloat)lineWidth toView:(UIView *)view
{
    __weak JLNoSingleColorProgressHUD * weakSelf = self;
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^
    {
        __strong JLNoSingleColorProgressHUD *strongSelf = weakSelf;
        
        if (strongSelf)
        {
            if (lineColor)
            {
                self.lineColor = lineColor;
            }
            
            if (lineWidth)
            {
                self.lineWidth = lineWidth;
            }
            
            self.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
            [self setup];
            [view addSubview:self];
        }
    }];
    
    
}

@end
