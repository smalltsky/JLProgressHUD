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
#import "JLGifAnimatedView.h"
#import "JLAcvitityIndicatorAnimatedView.h"

@interface JLProgressHUD()

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
@property (nonatomic,assign) CGSize imageViewSize;

//默认 为10.0
@property (nonatomic,assign) CGFloat offSetY;

//默认 为白色 只有JLProgressHUDType类型为JLProgressHUDTypeAnimation时有用
@property (nonatomic,strong) UIColor *animationSpinnerColor;
//默认 为白色 只有JLProgressHUDType类型为JLProgressHUDTypeAnimation时有用
@property (nonatomic,strong) UIColor *animationInfoColor;
//JLProgressHUDNormalColorTypeColor时 默认红和蓝
@property (nonatomic,strong) NSArray *colors;

@property (nonatomic,strong) UIView *backgroundView;

@property (nonatomic,strong) UIView *contentView;

@property (nonatomic,strong) UILabel *statusLabel;

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) JLLoadingAnimatedView *loadingAnimatedView;

@property (nonatomic,strong) JLProgressAnimatedView *ringView;

@property (nonatomic,strong) JLGifAnimatedView *gifAnimatedView;

@property (nonatomic,strong) JLAcvitityIndicatorAnimatedView *animatedView;

@property (nonatomic,assign) JLProgressHUDAnimationType animationType;

@property (nonatomic,assign) JLProgressHUDType HUDType;

@property (nonatomic,assign) BOOL animation;

@property (nonatomic,strong) UIImage *infoImage;
@property (nonatomic,strong) UIImage *successImage;
@property (nonatomic,strong) UIImage *failureImage;

@property (nonatomic,strong) NSString *imageName;

@property (nonatomic,readwrite) CGFloat progress;


@end

@implementation JLProgressHUD

- (UIView *)backgroundView
{
    if (!_backgroundView)
    {
        self.backgroundView = [[UIView alloc]initWithFrame:self.bounds];
    }
    
    return _backgroundView;
}

- (UIView *)contentView
{
    if (!_contentView)
    {
        self.contentView = [[UIView alloc]init];
    }
    
    return _contentView;
}

- (UILabel *)statusLabel
{
    if (!_statusLabel)
    {
        self.statusLabel = [[UILabel alloc]init];
    }
    
    return _statusLabel;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        self.imageView = [[UIImageView alloc]init];
    }
    
    return _imageView;
}

- (JLLoadingAnimatedView *)loadingAnimatedView
{
    if (!_loadingAnimatedView)
    {
        CGRect rect = [self getloadingAnimatedViewRect];
        if (self.colorType == JLProgressHUDNormalColorTypeColor)
        {
            self.loadingAnimatedView = [[JLLoadingAnimatedView alloc]initWithFrame:rect andLineWidth:3.0 andLineColor:self.colors];
        }
        
        if (self.colorType == JLProgressHUDNormalColorTypeWhite)
        {
            //@[[UIColor colorWithCss:@(0xeeeeee) alpha:0.8]]
            self.loadingAnimatedView = [[JLLoadingAnimatedView alloc]initWithFrame:rect andLineWidth:3.0 andLineColor:@[[UIColor colorWithCss:@(0xeeeeee) alpha:0.8]]];
        }
        
        if (self.colorType == JLProgressHUDNormalColorTypeBlack)
        {
            //@[[UIColor colorWithCss:@(0x111111) alpha:0.8]]
            self.loadingAnimatedView = [[JLLoadingAnimatedView alloc]initWithFrame:rect andLineWidth:3.0 andLineColor:@[[UIColor colorWithCss:@(0x111111) alpha:0.8]]];
        }
    
    
    }
    
    return _loadingAnimatedView;
}

- (JLProgressAnimatedView *)ringView
{
    if(!_ringView)
    {
        JLProgressAnimatedViewType type = [self getRadius];
        self.ringView = [[JLProgressAnimatedView alloc] initWithType:type];
    }
    
    return _ringView;
}

- (JLGifAnimatedView *)gifAnimatedView
{
    if (!_gifAnimatedView)
    {
        self.gifAnimatedView = [[JLGifAnimatedView alloc]initWithGifImageName:self.imageName];
        //self.gifAnimatedView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _gifAnimatedView;
}

-(JLAcvitityIndicatorAnimatedView *)animatedView
{
    if (!_animatedView)
    {
        JLAcvitityIndicatorAnimatedType type = [self getAnimatedViewSizeType];
        self.animatedView = [[JLAcvitityIndicatorAnimatedView alloc]initWithType:type];
        //self.animatedView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _animatedView;
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

- (instancetype)initWithFrame:(CGRect)frame
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
        self.offSetY = 10.0;
        self.animationInfoColor = [UIColor whiteColor];
        self.animationSpinnerColor = [UIColor whiteColor];
        self.colors = @[[UIColor redColor],[UIColor blueColor]];
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

+ (instancetype)allocWithZone:(struct _NSZone *)zone
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
    [self showProgress:JLProgressHUDTypeNormal status:status Progress:@(-1) image:nil];
}

+ (void)showInfoWithStatus:(nullable NSString *)status
{
    
    [self showProgress:JLProgressHUDTypeImage status:status Progress:@(-1) image:[self sharedView].infoImage];
}

+ (void)showSuccessWithStatus:(NSString *)status
{
    [self showProgress:JLProgressHUDTypeImage status:status Progress:@(-1) image:[self sharedView].successImage];
}

+ (void)showFailureWithStatus:(NSString *)status
{
    [self showProgress:JLProgressHUDTypeImage status:status Progress:@(-1) image:[self sharedView].failureImage];
}

+ (void)showAnimationWithStatus:(NSString*)status
{
    [self sharedView].animationType = JLProgressHUDAnimationTypeNormal;
    [self sharedView].animation = YES;
    [self showProgress:JLProgressHUDTypeAnimation status:status Progress:@(-1) image:nil];
}

+ (void)showAnimationInfoWithStatus:(NSString *)status animated:(BOOL)animated
{
    [self sharedView].animationType = JLProgressHUDAnimationTypeInfo;
    [self sharedView].animation = animated;
    [self showProgress:JLProgressHUDTypeAnimation status:status Progress:@(-1) image:nil];
}

+ (void)showAnimationSuccessWithStatus:(NSString *)status animated:(BOOL)animated
{
    [self sharedView].animationType = JLProgressHUDAnimationTypeSuccess;
    [self sharedView].animation = animated;
    [self showProgress:JLProgressHUDTypeAnimation status:status Progress:@(-1) image:nil];
}

+ (void)showAnimationFailureWithStatus:(NSString *)status animated:(BOOL)animated
{
    [self sharedView].animationType = JLProgressHUDAnimationTypeFailure;
    [self sharedView].animation = animated;
    [self showProgress:JLProgressHUDTypeAnimation status:status Progress:@(-1) image:nil];
}

+ (void)showWithImage:(UIImage *)image Status:(NSString *)status
{
    [self showProgress:JLProgressHUDTypeImage status:status Progress:@(-1) image:image];
}

+ (void)showWithGifImageName:(NSString *)name Status:(NSString *)status
{
    [self sharedView].imageName = name;
    [self showProgress:JLProgressHUDTypeGifImage status:status Progress:@(-1) image:nil];
}

+ (void)showWithProgress:(NSNumber *)progress Status:(NSString *)status
{
    [self showProgress:JLProgressHUDTypeProgress status:status Progress:progress image:nil];
}

+ (void)showProgress:(JLProgressHUDType)type status:(NSString *)status Progress:(NSNumber *)progress image:(UIImage *)image
{
    [[self sharedView] showProgress:type status:status Progress:progress image:image];
}

- (void)showProgress:(JLProgressHUDType)type status:(NSString *)status Progress:(NSNumber *)progress image:(UIImage *)image
{
    
    __weak JLProgressHUD * weakSelf = self;
    self.progress = progress.floatValue;
    self.HUDType = type;
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
                if(!strongSelf.loadingAnimatedView.superview)
                {
                    [strongSelf.contentView addSubview:strongSelf.loadingAnimatedView];
                    
                }
                
                CGFloat centerY;
                if(strongSelf.statusLabel.text && ![strongSelf.statusLabel.text isEqualToString:@""])
                {
                    centerY = strongSelf.contentView.frame.size.height/2 - self.offSetY;
                }
                else
                {
                    centerY = strongSelf.contentView.frame.size.height/2;
                }
                
                strongSelf.loadingAnimatedView.center = CGPointMake(strongSelf.contentView.frame.size.width/2,centerY);
            }
            
            if (type == JLProgressHUDTypeProgress)
            {
                if(strongSelf.progress != -1)
                {
                    // Add ring to HUD
                    if(!strongSelf.ringView.superview)
                    {
                        [strongSelf.contentView addSubview:strongSelf.ringView];
                        
                    }
                    
                    // Set progress animated
                    strongSelf.ringView.progress =strongSelf.progress;
                    
                    CGFloat centerY;
                    if(strongSelf.statusLabel.text && ![strongSelf.statusLabel.text isEqualToString:@""])
                    {
                        centerY = strongSelf.contentView.frame.size.height/2 - self.offSetY;
                    }
                    else
                    {
                        centerY = strongSelf.contentView.frame.size.height/2;
                    }
                    
                    strongSelf.ringView.center = CGPointMake(strongSelf.contentView.frame.size.width/2,centerY);
                }
            }
            
            if (type == JLProgressHUDTypeImage)
            {
                if (!strongSelf.imageView.superview)
                {
                    strongSelf.imageView.frame = CGRectMake(0, 0,strongSelf.imageViewSize.width, strongSelf.imageViewSize.height);
                    [strongSelf.contentView addSubview:strongSelf.imageView];
                    strongSelf.imageView.image = image;
                    CGFloat centerY;
                    if(strongSelf.statusLabel.text && ![strongSelf.statusLabel.text isEqualToString:@""])
                    {
                        centerY = strongSelf.contentView.frame.size.height/2 - self.offSetY;
                    }
                    else
                    {
                        centerY = strongSelf.contentView.frame.size.height/2;
                    }
                    
                    strongSelf.imageView.center = CGPointMake(strongSelf.contentView.frame.size.width/2,centerY);
                }
                
            }
            
            if (type == JLProgressHUDTypeGifImage)
            {
                if (!strongSelf.gifAnimatedView.superview)
                {
                    strongSelf.gifAnimatedView.frame = CGRectMake(0, 0,strongSelf.imageViewSize.width, strongSelf.imageViewSize.height);
                    [strongSelf.contentView addSubview:strongSelf.gifAnimatedView];
                    CGFloat centerY;
                    if(strongSelf.statusLabel.text && ![strongSelf.statusLabel.text isEqualToString:@""])
                    {
                        centerY = strongSelf.contentView.frame.size.height/2 - self.offSetY;
                    }
                    else
                    {
                        centerY = strongSelf.contentView.frame.size.height/2;
                    }
                    
                    strongSelf.gifAnimatedView.center = CGPointMake(strongSelf.contentView.frame.size.width/2,centerY);
                }
            }
            
            if (type == JLProgressHUDTypeAnimation)
            {
                if (!strongSelf.animatedView.superview)
                {
                    [strongSelf.contentView addSubview:strongSelf.animatedView];
                }
                
                CGFloat centerY;
                if(strongSelf.statusLabel.text && ![strongSelf.statusLabel.text isEqualToString:@""])
                {
                    centerY = strongSelf.contentView.frame.size.height/2 - self.offSetY;
                }
                else
                {
                    centerY = strongSelf.contentView.frame.size.height/2;
                }
                
                strongSelf.animatedView.center = CGPointMake(strongSelf.contentView.frame.size.width/2,centerY);
                
                if (strongSelf.animationType == JLProgressHUDAnimationTypeNormal)
                {
                    [strongSelf.animatedView startAnimating];
                }
                
                if (strongSelf.animationType == JLProgressHUDAnimationTypeInfo)
                {
                    [strongSelf.animatedView updateToInfo:strongSelf.animation];
                }
                
                if (strongSelf.animationType == JLProgressHUDAnimationTypeSuccess)
                {
                    [strongSelf.animatedView updateToSuccess:strongSelf.animation];
                }
                
                if (strongSelf.animationType == JLProgressHUDAnimationTypeFailure)
                {
                    [strongSelf.animatedView updateToFail:strongSelf.animation];
                }
            }
        
            UIView *view = [[UIApplication sharedApplication] getViewInCurrentViewController];
            [view addSubview:strongSelf];
        }
    }];
}

-(CGRect)getloadingAnimatedViewRect
{
    CGRect rect = CGRectMake(0, 0, 0, 0);
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeNormal)
    {
        rect = CGRectMake(0, 0, 60, 60);
    }
    
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeSmall)
    {
        rect = CGRectMake(0, 0, 40, 40);

    }
    
    return rect;
}

- (JLProgressAnimatedViewType)getRadius
{
    JLProgressAnimatedViewType type = JLProgressAnimatedViewTypeNormal;
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeNormal)
    {
        type = JLProgressAnimatedViewTypeNormal;
    }
    
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeSmall)
    {
        type = JLProgressAnimatedViewTypeSmall;
    }
    
    return type;
}

- (JLAcvitityIndicatorAnimatedType)getAnimatedViewSizeType
{
    JLAcvitityIndicatorAnimatedType type = JLAcvitityIndicatorAnimatedTypeNormal;
    
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeNormal)
    {
        type = JLAcvitityIndicatorAnimatedTypeNormal;
    }
    
    if (self.standardWidthType == JLProgressHUDStandardWidthTypeSmall)
    {
        type = JLAcvitityIndicatorAnimatedTypeSmall;
    }
    
    return type;
}

- (CGFloat)getStandardWidth
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

- (CGFloat)getContentWidthWithStatus:(NSString *)status
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

- (UIColor *)getContentViewColor
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

- (UIColor *)getstatusLabelTextColor
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
    
    if (self.colorType == JLProgressHUDNormalColorTypeColor)
    {
        if (self.styleType == JLProgressHUDStyleTypeBlack)
        {
            color = [UIColor colorWithCss:@(0xeeeeee) alpha:0.8];
        }
        
        if (self.styleType == JLProgressHUDStyleTypeWhite)
        {
            color = [UIColor colorWithCss:@(0x111111) alpha:0.8];
        }
    }
    
    return color;
}

- (void)setcolorType
{
    if (self.colorType == JLProgressHUDNormalColorTypeColor)
    {
        return;
    }
    
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
    __weak JLProgressHUD * weakSelf = self;
    weakSelf.progress = -1.0;
    [UIView animateWithDuration:delay animations:^
     {
         __strong JLProgressHUD *strongSelf = weakSelf;
         strongSelf.alpha = 0.0;
         
         if (strongSelf.HUDType == JLProgressHUDTypeNormal)
         {
             [self.loadingAnimatedView removeFromSuperview];
             self.loadingAnimatedView = nil;
         }
         
         if (strongSelf.HUDType == JLProgressHUDTypeProgress)
         {
             [strongSelf.ringView removeFromSuperview];
         }
         
         if (strongSelf.HUDType == JLProgressHUDTypeImage)
         {
             [strongSelf.imageView removeFromSuperview];
         }
         
         if (strongSelf.HUDType == JLProgressHUDTypeGifImage)
         {
             [strongSelf.gifAnimatedView removeFromSuperview];
         }
         
         if (strongSelf.HUDType == JLProgressHUDTypeAnimation)
         {
             [strongSelf.animatedView stopAnimate];
             [strongSelf.animatedView removeFromSuperview];
         }
         
         [strongSelf.contentView removeFromSuperview];
         [strongSelf.backgroundView removeFromSuperview];
         
     } completion:^(BOOL finished)
     {
         __strong JLProgressHUD *strongSelf = weakSelf;
         strongSelf.alpha = 1.0;
         [strongSelf removeFromSuperview];
     }];
}

-(void)setColorType:(JLProgressHUDNormalColorType)colorType
{
    _colorType = colorType;
}

-(void)setStyleType:(JLProgressHUDStyleType)styleType
{
    _styleType = styleType;
}

-(void)setStandardWidthType:(JLProgressHUDStandardWidthType)standardWidthType
{
    _standardWidthType = standardWidthType;
}

-(void)setStatusFont:(UIFont *)statusFont
{
    _statusFont = statusFont;
}

-(void)setAllProgressColor:(UIColor *)allProgressColor
{
    _allProgressColor = allProgressColor;
}

-(void)setNoAllProgressColor:(UIColor *)noAllProgressColor
{
    _noAllProgressColor = noAllProgressColor;
}

-(void)setImageViewSize:(CGSize)imageViewSize
{
    _imageViewSize = imageViewSize;
}

-(void)setOffSetY:(CGFloat)offSetY
{
    _offSetY = offSetY;
}

-(void)setAnimationInfoColor:(UIColor *)animationInfoColor
{
    _animationInfoColor = animationInfoColor;
    [self.animatedView setInfoColor:animationInfoColor];
}


-(void)setAnimationSpinnerColor:(UIColor *)animationSpinnerColor
{
    _animationSpinnerColor = animationSpinnerColor;
    [self.animatedView setSpinnerColor:animationSpinnerColor];
}

-(void)setColors:(NSArray *)colors
{
    _colors = colors;
}

@end
