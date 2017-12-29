//
//  JLSingleProgressHUD.m
//  JLSingleProgressHUD
//
//  Created by 刘奇天 on 2017/12/25.
//

#import "JLSingleColorProgressHUD.h"
#import "UIColor+css.h"



@interface JLSingleColorProgressHUD()
{
    UIView *backView;
    UIImageView *imageView;
}

+ (JLSingleColorProgressHUD *)sharedView;

@end

@implementation JLSingleColorProgressHUD

+(JLSingleColorProgressHUD *)sharedView
{
    static dispatch_once_t once;
    
    static JLSingleColorProgressHUD *sharedView;
#if !defined(SV_APP_EXTENSIONS)
    dispatch_once(&once, ^{ sharedView = [[self alloc] initWithFrame:[[[UIApplication sharedApplication] delegate] window].bounds]; });
#else
    dispatch_once(&once, ^{ sharedView = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]]; });
#endif
    return sharedView;
}

+ (void)showReloadViewToView:(UIView *)view withDelegate:(id)delegate
{
    [JLSingleColorProgressHUD sharedView].delegate = delegate;
    [[JLSingleColorProgressHUD sharedView] showReloadViewToView:view];
}

- (void)showReloadViewToView:(UIView *)view
{
    UIImage *image = [UIImage imageNamed:@"error.png"];
    
    NSLog(@"%@",NSStringFromCGRect(self.frame));
    NSLog(@"%@",NSStringFromCGSize(image.size));
    
    // ** ** **
    
    if (backView)
    {
        [backView removeFromSuperview];
    }
    
    backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    backView.backgroundColor = [UIColor whiteColor];
    backView.userInteractionEnabled = YES;
    
    UIWindow* window =  [UIApplication sharedApplication].keyWindow;
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 125, 221)];
    imageView.center = window.center;
    imageView.image = image;
    imageView.backgroundColor = [UIColor whiteColor];
    [backView addSubview:imageView];
    
    imageView.userInteractionEnabled = YES;
    view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImageView:)];
    [backView addGestureRecognizer:tap];
    
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, imageView.frame.origin.y + 230, [UIScreen mainScreen].bounds.size.width - 20, 25)];
    // tipLabel.backgroundColor = [UIColor yellowColor];
    tipLabel.text = @"暂无内容，请点击重新加载";
    tipLabel.font = [UIFont systemFontOfSize:13.0];
    tipLabel.textColor = [UIColor colorWithCss:@(0x7d7d7d)];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:tipLabel];
    
    [view addSubview:backView];
}

- (void)clickImageView:(UITapGestureRecognizer *)sender
{
    
    //[imageView removeFromSuperview];
    [sender.view removeFromSuperview];
    NSLog(@"点击 图片");
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(refurbishDataAagin)])
    {
        [self.delegate refurbishDataAagin];
        
    }
    
}

@end
