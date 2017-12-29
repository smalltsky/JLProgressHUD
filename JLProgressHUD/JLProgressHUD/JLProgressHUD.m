//
//  JLProgressHUD.m
//  iOS Demo
//
//  Created by KuaiJie on 2017/12/25.
//

#import "JLProgressHUD.h"


@implementation JLProgressHUD

+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type toView:(UIView *)view
{
    [JLNoSingleColorProgressHUD showType:type toView:view];
}

+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type withLineColor:(NSArray *)lineColor toView:(UIView *)view
{
    [JLNoSingleColorProgressHUD showType:type withLineColor:lineColor toView:view];
}

+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type withLineWidth:(CGFloat)lineWidth toView:(UIView *)view
{
    [JLNoSingleColorProgressHUD showType:type withLineWidth:lineWidth toView:view];
}

+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type withLineColor:(NSArray *)lineColor andLineWidth:(CGFloat)lineWidth toView:(UIView *)view
{
    [JLNoSingleColorProgressHUD showType:type withLineColor:lineColor andLineWidth:lineWidth toView:view];
}

+ (void)dismissNoSingleColorProgressHUD
{
    [JLNoSingleColorProgressHUD dismiss];
}

+ (void)showReloadViewToView:(UIView *)view withDelegate:(id)delegate
{
    [JLSingleColorProgressHUD showReloadViewToView:view withDelegate:delegate];
}

+ (void)showSingleColorProgressHUDWithStatus:(NSString *)status
{
    [JLSingleColorProgressHUD showWithStatus:status];
}

+ (void)showSingleColorProgressHUDProgress:(float)progress
{
    [JLSingleColorProgressHUD showProgress:progress];
}

+ (void)showSingleColorProgressHUDInfoWithStatus:(NSString*)status
{
    [JLSingleColorProgressHUD showInfoWithStatus:status];
}

+ (void)showSingleColorProgressHUDSuccessWithStatus:(NSString*)status
{
    [JLSingleColorProgressHUD showSuccessWithStatus:status];
}

+ (void)showSingleColorProgressHUDErrorWithStatus:(NSString*)status
{
    [JLSingleColorProgressHUD showErrorWithStatus:status];
}

+ (void)showSingleColorProgressHUDImage:(UIImage*)image
{
    [JLSingleColorProgressHUD showImage:image status:nil];
}

+ (void)showSingleColorProgressHUDImage:(UIImage*)image status:(NSString*)status
{
    [JLSingleColorProgressHUD showImage:image status:status];
}

+ (void)dismissSingleColorProgressHUD
{
    [JLSingleColorProgressHUD dismiss];
}



@end
