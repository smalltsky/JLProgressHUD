//
//  ViewController.m
//  JLProgressHUD
//
//  Created by KuaiJie on 2017/12/29.
//  Copyright © 2017年 private. All rights reserved.
//

#import "ViewController.h"
#import "JLProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [JLProgressHUD showSingleColorProgressHUDWithStatus:@"加载中..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD dismissSingleColorProgressHUD];
        [JLProgressHUD showNoSingleColorProgressHUDType:JLSizeTypeNormal toView:self.view];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD dismissNoSingleColorProgressHUD];
    });
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
