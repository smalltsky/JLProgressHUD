//
//  UIApplication+auxiliary.h
//  JLProgressHUD
//
//  Created by smalltsky on 2017/12/21.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (auxiliary)

- (UIViewController *)getCurrentViewController;

- (UIView *)getViewInCurrentViewController;

@end
