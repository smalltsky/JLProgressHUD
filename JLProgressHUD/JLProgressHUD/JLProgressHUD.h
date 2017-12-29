//
//  JLProgressHUD.h
//  iOS Demo
//
//  Created by KuaiJie on 2017/12/25.
//

#import <Foundation/Foundation.h>
//#import "JLSingleColorProgressHUD.h"
#import "JLNoSingleColorProgressHUD.h"

@interface JLProgressHUD : NSObject

+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type toView:(UIView *)view;

+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type withLineColor:(NSArray *)lineColor toView:(UIView *)view;
+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type withLineWidth:(CGFloat)lineWidth toView:(UIView *)view;

+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type withLineColor:(NSArray *)lineColor andLineWidth:(CGFloat)lineWidth toView:(UIView *)view;

+ (void)dismissNoSingleColorProgressHUD;

/*+ (void)showReloadViewToView:(UIView *)view withDelegate:(id)delegate;

+ (void)showSingleColorProgressHUDWithStatus:(NSString *)status;
+ (void)showSingleColorProgressHUDProgress:(float)progress;
+ (void)showSingleColorProgressHUDInfoWithStatus:(NSString*)status;
+ (void)showSingleColorProgressHUDSuccessWithStatus:(NSString*)status;
+ (void)showSingleColorProgressHUDErrorWithStatus:(NSString*)status;

+ (void)showSingleColorProgressHUDImage:(UIImage*)image;
+ (void)showSingleColorProgressHUDImage:(UIImage*)image status:(NSString*)status;
+ (void)dismissSingleColorProgressHUD;*/

@end
