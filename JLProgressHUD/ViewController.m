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
    //[JLProgressHUD showWithStatus:@"加载中..."];
    /*[JLProgressHUD showWithProgress:@(0.1) Status:@"666"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD showWithProgress:@(0.4) Status:@"666"];
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD showWithProgress:@(0.7) Status:@"666"];
                       
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(12.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD showWithProgress:@(0.9) Status:@"666"];
                       
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD showWithProgress:@(1.0) Status:@"666"];
                       
    });*/
    
    //[JLProgressHUD showInfoWithStatus:@"你违法了，请跟我去警察局一趟！"];
    //[JLProgressHUD showFailureWithStatus:@"加载失败!"];
    [JLProgressHUD showSuccessWithStatus:@"加载成功!"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
