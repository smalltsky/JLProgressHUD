//
//  JLSingleProgressHUD.h
//  JLSingleProgressHUD
//
//  Created by 刘奇天 on 2017/12/25.
//

#import "SVProgressHUD.h"

@protocol JLSingleColorProgressHUDDelegate <NSObject>

- (void)refurbishDataAagin;

@end

@interface JLSingleColorProgressHUD : SVProgressHUD

+ (void)showReloadViewToView:(UIView *)view withDelegate:(id)delegate;

@property (weak, nonatomic) id<JLSingleColorProgressHUDDelegate>delegate;

@end
