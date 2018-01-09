//
//  JLProgressAnimatedView.m
//  JLProgressHUD
//
//  Created by smalltsky on 2018/1/2.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import "JLProgressAnimatedView.h"

@interface JLProgressAnimatedView()
{
    CGFloat _padding;
}

@property (strong,nonatomic) CAShapeLayer * backgroundLayer;

@property (strong,nonatomic) CAShapeLayer * progressLayer;

@property (strong,nonatomic,readwrite) UILabel * progressLabel;

@property (nonatomic,assign) JLProgressAnimatedViewType animatedType;

@end

@implementation JLProgressAnimatedView

-(void)transactionUpdate:(void(^)(void))block
{
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue
                     forKey:kCATransactionDisableActions];
    block();
    [CATransaction commit];
}

-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    _progress = MAX(0.0, _progress);
    _progress = MIN(1.0, _progress);
    
    [self transactionUpdate:^
    {
        self.progressLayer.strokeEnd = progress;
    }];
    
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f%%",_progress * 100];
}

-(CGSize)intrinsicContentSize
{
    CGFloat wh = 0.0;
    
    if (_animatedType == JLProgressAnimatedViewTypeNormal)
    {
        wh = 60.0;
    }
    
    if (_animatedType == JLProgressAnimatedViewTypeSmall)
    {
        wh = 40.0;
    }
    
    return CGSizeMake(wh, wh);
}

-(instancetype)initWithType:(JLProgressAnimatedViewType)type
{
    CGFloat wh = 0.0;
    
    if (type == JLProgressAnimatedViewTypeNormal)
    {
        wh = 60.0;
    }
    
    if (type == JLProgressAnimatedViewTypeSmall)
    {
        wh = 40.0;
    }
    
    if (self = [super initWithFrame:CGRectMake(0,0,wh,wh)])
    {
        _padding = 6.0;
        _backgroundLayer = [CAShapeLayer layer];
        _animatedType = type;
        CGFloat width = self.bounds.size.width;
        CGFloat height = self.bounds.size.height;
        CGPoint center = CGPointMake(width/2, height/2);
        CGFloat min = MIN(width, height);
        CGFloat radius = min/2 - _padding;
        
        UIBezierPath * bezierPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI/2 endAngle:M_PI * 2 - M_PI/2 clockwise:YES];
        UIBezierPath * bz2 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI/2 endAngle:M_PI * 2 - M_PI/2 clockwise:YES];
        
        _backgroundLayer.path = bezierPath.CGPath;
        _backgroundLayer.strokeStart = 0.00;
        _backgroundLayer.strokeEnd = 1.0;
        _backgroundLayer.lineCap = kCALineCapRound;
        _backgroundLayer.lineWidth = 3.0;
        _backgroundLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        _backgroundLayer.fillColor = [UIColor clearColor].CGColor;
        _backgroundLayer.anchorPoint = CGPointMake(0.5, 0.5);
        _backgroundLayer.position = center;
        _backgroundLayer.bounds = self.bounds;
        [self.layer addSublayer:_backgroundLayer];
        
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.path = bz2.CGPath;
        _progressLayer.strokeStart = 0.00;
        _progressLayer.strokeEnd = 0.00;
        _progressLayer.lineCap = kCALineCapRound;
        _progressLayer.lineWidth = 3.0;
        _progressLayer.strokeColor = [UIColor blueColor].CGColor;
        _progressLayer.fillColor = [UIColor clearColor].CGColor;
        _progressLayer.anchorPoint = CGPointMake(0.5, 0.5);
        _progressLayer.position = center;
        _progressLayer.bounds = self.bounds;
        [self.layer addSublayer:_progressLayer];
        
        self.progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
        self.progressLabel.textColor = [UIColor whiteColor];
        self.progressLabel.font = [UIFont boldSystemFontOfSize:10];
        self.progressLabel.center = center;
        self.progressLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.progressLabel];
    }
    
    return self;
}

@end
