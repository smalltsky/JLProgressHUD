//
//  UIApplication+auxiliary.m
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/21.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import "UIApplication+auxiliary.h"

@implementation UIApplication (auxiliary)

- (UIViewController *)getCurrentViewController
{
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    
    while (resultVC.presentedViewController)
    {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UINavigationController class]])
    {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    }
    else if ([vc isKindOfClass:[UITabBarController class]]) {
        
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    }
    else
    {
        return vc;
    }
    
    return nil;
}

- (UIView *)getViewInCurrentViewController
{
    return [self getCurrentViewController].view;
}

@end
