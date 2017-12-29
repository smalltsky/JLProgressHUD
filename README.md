# JLProgressHUD

添加了多颜色菊花，可以自定义菊花颜色

JLProgressHUD.h

//多颜色方法
+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type toView:(UIView *)view;

+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type withLineColor:(NSArray *)lineColor toView:(UIView *)view;
+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type withLineWidth:(CGFloat)lineWidth toView:(UIView *)view;

+ (void)showNoSingleColorProgressHUDType:(JLSizeType)type withLineColor:(NSArray *)lineColor andLineWidth:(CGFloat)lineWidth toView:(UIView *)view;

+ (void)dismissNoSingleColorProgressHUD;

+ (void)showReloadViewToView:(UIView *)view withDelegate:(id)delegate;

//单一颜色方法
+ (void)showSingleColorProgressHUDWithStatus:(NSString *)status;
+ (void)showSingleColorProgressHUDProgress:(float)progress;
+ (void)showSingleColorProgressHUDInfoWithStatus:(NSString*)status;
+ (void)showSingleColorProgressHUDSuccessWithStatus:(NSString*)status;
+ (void)showSingleColorProgressHUDErrorWithStatus:(NSString*)status;

+ (void)showSingleColorProgressHUDImage:(UIImage*)image;
+ (void)showSingleColorProgressHUDImage:(UIImage*)image status:(NSString*)status;
+ (void)dismissSingleColorProgressHUD;

