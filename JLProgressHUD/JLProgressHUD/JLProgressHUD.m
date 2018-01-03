//
//  JLProgressHUD.m
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/25.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import "JLProgressHUD.h"
#import "JLLoadingAnimatedView.h"
#import "NSObject+CGSize.h"
#import "UIApplication+auxiliary.h"
#import "UIColor+css.h"
#import "JLProgressAnimatedView.h"

@interface JLProgressHUD()

@property (nonatomic,strong) UIView *backgroundView;

@property (nonatomic,strong) UIView *contentView;

@property (nonatomic,strong) UILabel *statusLabel;

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) JLLoadingAnimatedView *loadingAnimatedView;

@property (nonatomic,strong) JLProgressAnimatedView *ringView;

@property (nonatomic,strong) JLProgressAnimatedView *backgroundRingView;

@property (nonatomic,strong) UIImage *infoImage;
@property (nonatomic,strong) UIImage *successImage;
@property (nonatomic,strong) UIImage *failureImage;

@property (nonatomic,readwrite) CGFloat progress;


@end

@implementation JLProgressHUD

-(UIView *)backgroundView
{
    if (!_backgroundView)
    {
        self.backgroundView = [[UIView alloc]initWithFrame:self.bounds];
    }
    
    return _backgroundView;
}

-(UIView *)contentView
{
    if (!_contentView)
    {
        self.contentView = [[UIView alloc]init];
    }
    
    return _contentView;
}

-(UILabel *)statusLabel
{
    if (!_statusLabel)
    {
        self.statusLabel = [[UILabel alloc]init];
    }
    
    return _statusLabel;
}

-(UIImageView *)imageView
{
    if (!_imageView)
    {
        self.imageView = [[UIImageView alloc]init];
    }
    
    return _imageView;
}

-(JLLoadingAnimatedView *)loadingAnimatedView
{
    if (!_loadingAnimatedView)
    {
        JLJLLoadingAnimatedViewSizeType type = [self getAnimatedViewSizeType];
        if (self.colorType == JLProgressHUDNormalColorTypeColor)
        {
            self.loadingAnimatedView = [JLLoadingAnimatedView showType:type toView:self.contentView];
        }
        
        if (self.colorType == JLProgressHUDNormalColorTypeWhite)
        {
            self.loadingAnimatedView = [JLLoadingAnimatedView showType:type withLineColor:@[[UIColor colorWithCss:@(0xeeeeee) alpha:0.8]] toView:self.contentView];
        }
        
        if (self.colorType == JLProgressHUDNormalColorTypeBlack)
        {
            self.loadingAnimatedView = [JLLoadingAnimatedView showType:type withLineColor:@[[UIColor colorWithCss:@(0x111111) alpha:0.8]] toView:self.contentView];
        }
    }
    
    return _loadingAnimatedView;
}

- (JLProgressAnimatedView *)ringView
{
    if(!_ringView)
    {
        _ringView = [[JLProgressAnimatedView alloc] initWithFrame:CGRectZero];
        //_ringView.strokeEnd = 0.0;
    }
    
    // Update styling
    _ringView.strokeColor = self.noAllProgressColor;
    _ringView.strokeThickness = 2.0;
    _ringView.radius = [self getRadius];
    
    return _ringView;
}

- (JLProgressAnimatedView *)backgroundRingView
{
    if(!_backgroundRingView)
    {
        _backgroundRingView = [[JLProgressAnimatedView alloc] initWithFrame:CGRectZero];
        _backgroundRingView.strokeEnd = 1.0;
    }
    
    // Update styling
    _backgroundRingView.strokeColor = self.allProgressColor;
    _backgroundRingView.strokeThickness = 2.0;
    _backgroundRingView.radius = [self getRadius];
    
    return _backgroundRingView;
}

+ (JLProgressHUD *)sharedView
{
    static JLProgressHUD *sharedView;
#if !defined(SV_APP_EXTENSIONS)
    sharedView = [[self alloc] initWithFrame:[[[UIApplication sharedApplication] delegate] window].bounds];
#else
    sharedView = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
#endif
    return sharedView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.styleType = JLProgressHUDStyleTypeWhite;
        self.colorType = JLProgressHUDNormalColorTypeBlack;
        self.statusFont = [UIFont systemFontOfSize:14.0];
        self.standardWidthType = JLProgressHUDStandardWidthTypeNormal;
        self.noAllProgressColor = [UIColor redColor];
        self.allProgressColor = [UIColor grayColor];
        self.imageViewSize = CGSizeMake(27.0, 27.0);
        [self addSubview:self.backgroundView];
        [self addSubview:self.contentView];
        
        [self.contentView addSubview:self.statusLabel];
        
        NSBundle *bundle = [NSBundle bundleForClass:[JLProgressHUD class]];
        NSURL *url = [bundle URLForResource:@"JLProgressHUD" withExtension:@"bundle"];
        NSBundle *imageBundle = [NSBundle bundleWithURL:url];
        
        UIImage *infoImage = [UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"warning" ofType:@"png"]];
        UIImage *successImage = [UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"success" ofType:@"png"]];
        UIImage *failureImage = [UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"failure" ofType:@"png"]];
        
        self.infoImage = infoImage;
        self.successImage = successImage;
        self.failureImage = failureImage;
    }
    
    return self;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static JLProgressHUD *toolAudio;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
                      
        toolAudio = [super allocWithZone:zone];
                      
    });
    
    return toolAudio;
}

+ (void)showWithStatus:(NSString *)status
{
    [self showProgress:JLProgressHUDTypeNormal status:status colors:nil Progress:@0 image:nil];
}

+ (void)showInfoWithStatus:(nullable NSString *)status
{
    
    [self showProgress:JLProgressHUDTypeImage status:status colors:nil Progress:@0 image:[self sharedView].infoImage];
}

+ (void)showSuccessWithStatus:(NSString *)status
{
    [self showProgress:JLProgressHUDTypeImage status:status colors:nil Progress:@0 image:[self sharedView].successImage];
}

+ (void)showFailureWithStatus:(NSString *)status
{
    [self showProgress:JLProgressHUDTypeImage status:status colors:nil Progress:@0 image:[self sharedView].failureImage];
}

+ (void)showWithImage:(UIImage *)image Status:(NSString *)status
{
    [self showProgress:JLProgressHUDTypeImage status:status colors:nil Progress:@0 image:image];
}

+ (void)showWithProgress:(NSNumber *)progress Status:(NSString *)status
{
    [self showProgress:JLProgressHUDTypeProgress status:status colors:nil Progress:progress image:nil];
}

+ (void)showProgress:(JLProgressHUDType)type status:(NSString *)status colors:(NSArray *)colors Progress:(NSNumber *)progress image:(UIImage *)image
{
    [[self sharedView] showProgress:type status:status colors:colors Progress:progress image:image];
}

- (void)showProgress:(JLProgressHUDType)type status:(NSString *)status colors:(NSArray *)colors Progress:(NSNumber *)progress image:(UIImage *)image
{
    
    __weak JLProgressHUD * weakSelf = self;
    self.progress = progress.floatValue;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^
    {
        __strong JLProgressHUD *strongSelf = weakSelf;
        
        if (strongSelf)
        {
            strongSelf.backgroundView.backgroundColor = [UIColor clearColor];
            CGFloat contentWidth = [strongSelf getContentWidthWithStatus:status];
            CGFloat standardWidth = [strongSelf getStandardWidth];
            
            strongSelf.contentView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-contentWidth)/2,([UIScreen mainScreen].bounds.size.height-standardWidth)/2, contentWidth, standardWidth);
            strongSelf.contentView.layer.cornerRadius = 10.0;
            strongSelf.contentView.layer.masksToBounds = YES;
            
            [strongSelf setcolorType];
            strongSelf.contentView.backgroundColor = [strongSelf getContentViewColor];
            
            strongSelf.statusLabel.frame = CGRectMake(0,strongSelf.contentView.frame.size.height-30,contentWidth, 20);
            strongSelf.statusLabel.font = strongSelf.statusFont;
            strongSelf.statusLabel.text = status;
            strongSelf.statusLabel.textAlignment = NSTextAlignmentCenter;
            strongSelf.statusLabel.textColor = [strongSelf getstatusLabelTextColor];
            
            if (type == JLProgressHUDTypeNormal)
            {
                strongSelf.loadingAnimatedView.lineWidth = 3.0;
            }
            
            if (type == JLProgressHUDTypeProgress)
            {
                // Add ring to HUD
                if(!strongSelf.backgroundRingView.superview)
                {
                    [strongSelf.contentView addSubview:strongSelf.backgroundRingView];
                }
                
                if(!strongSelf.ringView.superview)
                {
                    [strongSelf.contentView addSubview:strongSelf.ringView];
                    
                }
                
                // Set progress animated
                [CATransaction begin];
                [CATransaction setDisableActions:YES];
                strongSelf.ringView.strokeEnd = strongSelf.progress;
                [CATransaction commit];
                
                if(strongSelf.progress != -1)
                {
                    CGFloat centerY;
                    if(strongSelf.statusLabel.text && ![strongSelf.statusLabel.text isEqualToString:@""])
                    {
                        centerY = strongSelf.contentView.frame.size.height/2 - 10;
                    }
                    else
                    {
                        centerY = strongSelf.contentView.frame.size.height/2;
                    }
                    
                    strongSelf.backgroundRingView.center = strongSelf.ringView.center = CGPointMake(strongSelf.contentView.frame.size.width/2,centerY);
                }
            }
            
            if (type == JLProgressHUDTypeImage)
            {
                if (!strongSelf.imageView.superview)
                {
                    strongSelf.imageView.frame = CGRectMake(0, 0, 27, 27);
                    [strongSelf.contentView addSubview:strongSelf.imageView];
                    strongSelf.imageView.image = image;
                    CGFloat centerY;
                    if(strongSelf.statusLabel.text && ![strongSelf.statusLabel.text isEqualToString:@""])
                    {
                        centerY = strongSelf.contentView.frame.size.height/2 - 10;
                    }
                    else
                    {
                        centerY = strongSelf.contentView.frame.size.height/2;
                    }
                    
                    strongSelf.imageView.center = CGPointMake(strongSelf.contentView.frame.size.width/2,centerY);
                }
                
            }
        
            UIView *view = [[UIApplication sharedApplication] getViewInCurrentViewController];
            [view addSubview:self];
        }
    }];
}

-(CGFloat)getRadius
{
    CGFloat radius = 0.0;
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeNormal)
    {
        radius = self.statusLabel.text && ![self.statusLabel.text isEqualToString:@""] ? 18.0 : 24.0;
    }
    
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeSmall)
    {
        radius = self.statusLabel.text && ![self.statusLabel.text isEqualToString:@""] ? 13.0 : 19.0;
    }
    
    return radius;
}

-(JLJLLoadingAnimatedViewSizeType)getAnimatedViewSizeType
{
    JLJLLoadingAnimatedViewSizeType type = JLJLLoadingAnimatedViewSizeTypeBig;
    
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeNormal)
    {
        type = JLJLLoadingAnimatedViewSizeTypeNormal;
    }
    
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeSmall)
    {
        type = JLJLLoadingAnimatedViewSizeTypeSmall;
    }
    
    return type;
}

-(CGFloat)getStandardWidth
{
    CGFloat contentWidth = 0.0;
    
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeNormal)
    {
        contentWidth = 110.0;
    }
    
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeSmall)
    {
        contentWidth = 90.0;
    }
    
    return contentWidth;
}

-(CGFloat)getContentWidthWithStatus:(NSString *)status
{
    CGSize contentSize = [NSObject adaptiveText:status showHeight:20.0 fontSize:self.statusFont];
    CGFloat contentWidth;
    CGFloat standardWidth = [self getStandardWidth];
    if (contentSize.width > standardWidth-20.0)
    {
        contentWidth = contentSize.width + 20.0;
        
        if (contentWidth >= [UIScreen mainScreen].bounds.size.width-40.0)
        {
            contentWidth = [UIScreen mainScreen].bounds.size.width - 40.0;
        }
    }
    else
    {
        contentWidth = standardWidth;
    }
    
    return contentWidth;
}

-(UIColor *)getContentViewColor
{
    UIColor *color;
    if (self.styleType == JLProgressHUDStyleTypeWhite)
    {
        color = [UIColor colorWithCss:@(0xeeeeee) alpha:0.8];
    }
    
    if (self.styleType == JLProgressHUDStyleTypeBlack)
    {
        color = [UIColor colorWithCss:@(0x111111) alpha:0.8];
    }
    
    return color;
}

-(UIColor *)getstatusLabelTextColor
{
    UIColor *color;
    if (self.colorType == JLProgressHUDNormalColorTypeBlack)
    {
        color = [UIColor colorWithCss:@(0x111111) alpha:0.8];
    }
    
    if (self.colorType == JLProgressHUDNormalColorTypeWhite)
    {
        color = [UIColor colorWithCss:@(0xeeeeee) alpha:0.8];
    }
    
    return color;
}

-(void)setcolorType
{
    if (self.styleType == JLProgressHUDStyleTypeWhite)
    {
        self.colorType = JLProgressHUDNormalColorTypeBlack;
    }
    
    if (self.styleType == JLProgressHUDStyleTypeBlack)
    {
        self.colorType = JLProgressHUDNormalColorTypeWhite;
    }
}

+ (void)dismiss
{
    [self dismissWithDelay:0.0];
}

+ (void)dismissWithDelay:(NSTimeInterval)delay
{
    [[self sharedView] dismissWithDelay:delay];
}

- (void)dismiss
{
    [self dismissWithDelay:0.0];
}

- (void)dismissWithDelay:(NSTimeInterval)delay
{
    [UIView animateWithDuration:delay animations:^
     {
         self.alpha = 0.0;
         [JLLoadingAnimatedView dismiss];
         [self.ringView removeFromSuperview];
         [self.backgroundRingView removeFromSuperview];
         [self.imageView removeFromSuperview];
         [self.contentView removeFromSuperview];
         [self.backgroundView removeFromSuperview];
         
     } completion:^(BOOL finished)
     {
         self.alpha = 1.0;
         [self removeFromSuperview];
     }];
}

@end
