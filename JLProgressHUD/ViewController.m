//
//  ViewController.m
//  JLProgressHUD
//
//  Created by KuaiJie on 2017/12/29.
//  Copyright © 2017年 private. All rights reserved.
//

#import "ViewController.h"
#import "JLProgressHUD.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *methodArray;


@end

@implementation ViewController

-(NSMutableArray *)methodArray
{
    if (!_methodArray)
    {
        self.methodArray = [NSMutableArray array];
    }
    
    return _methodArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.methodArray addObject:@"NormalHUD"];
    [self.methodArray addObject:@"ProgressHUD"];
    [self.methodArray addObject:@"ProgressHUDText"];
    [self.methodArray addObject:@"InfoStatusHUD"];
    [self.methodArray addObject:@"FailureStatusHUD"];
    [self.methodArray addObject:@"SuccessStatusHUD"];
    [self.methodArray addObject:@"customHUD"];
    [self.methodArray addObject:@"GifImageHUD"];
    [self.methodArray addObject:@"AnimationInfoStatusHUD"];
    [self.methodArray addObject:@"AnimationFailureStatusHUD"];
    [self.methodArray addObject:@"AnimationSuccessStatusHUD"];

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    
    if (@available(iOS 11.0, *))
    {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [self.view addSubview:tableView];
    
    self.tableView = tableView;

    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)NormalHUD
{
    [JLProgressHUD showWithStatus:@"加载中..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD dismiss];
    });
}

- (void)ProgressHUD
{
    [JLProgressHUD showWithProgress:@(0.1) Status:@"666"];
    
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
                       
                   });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                   {
                       [JLProgressHUD dismiss];
                   });
    
    /*[JLProgressHUD showWithProgress:@(0.1) Status:@""];
     
     /*dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
     {
         [JLProgressHUD showWithProgress:@(0.4) Status:@""];
     });
     
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
     {
         [JLProgressHUD showWithProgress:@(0.7) Status:@""];
     });
     
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
     {
         [JLProgressHUD showWithProgress:@(0.9) Status:@""];
     });
     
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
     {
         [JLProgressHUD showWithProgress:@(1.0) Status:@""];
     });/*
    
    /*dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD dismiss];
    });*/
    
    
}

- (void)ProgressHUDText
{
    [JLProgressHUD showWithProgress:@(0.1) Status:@"666"];
    
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
                       
                   });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                   {
                       [JLProgressHUD dismiss];
                   });
    
    /*[JLProgressHUD showWithProgress:@(0.1) Status:@"加载中..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD showWithProgress:@(0.4) Status:@"加载中..."];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD showWithProgress:@(0.7) Status:@"加载中..."];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD showWithProgress:@(0.9) Status:@"加载中..."];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD showWithProgress:@(1.0) Status:@"加载中..."];
    });*/
    
    /*dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD dismiss];
    });*/
}

- (void)InfoStatusHUD
{
    [JLProgressHUD showInfoWithStatus:@"你违法了，请跟我去警察局一趟！"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD dismiss];
    });
}

- (void)FailureStatusHUD
{
    [JLProgressHUD showFailureWithStatus:@"加载失败!"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD dismiss];
    });
}

- (void)SuccessStatusHUD
{
    [JLProgressHUD showSuccessWithStatus:@"加载成功!"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD dismiss];
    });
}

- (void)customHUD
{
    //这种可以创建一个分类 方便以后使用 自定义菊花颜色
    JLProgressHUD *progress = [JLProgressHUD sharedView];
    [progress setStandardWidthType:JLProgressHUDStandardWidthTypeSmall];
    [progress setColorType:JLProgressHUDNormalColorTypeColor];
    [progress setStyleType:JLProgressHUDStyleTypeBlack];
    [progress setColors:@[[UIColor redColor],[UIColor blueColor],[UIColor yellowColor]]];
    [progress showProgress:JLProgressHUDTypeNormal status:@"加载中..." Progress:nil image:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD dismiss];
    });
}

- (void)GifImageHUD
{
    [JLProgressHUD showWithGifImageName:@"ajax-loader" Status:@"加载中..."];
     
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
     {
         [JLProgressHUD dismiss];
     });
}
//
- (void)AnimationInfoStatusHUD
{
    [JLProgressHUD showAnimationWithStatus:@"正在领取"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD showAnimationInfoWithStatus:@"您今天已经领取完了" animated:YES];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
        {
            [JLProgressHUD dismiss];
        });
    });
}

- (void)AnimationFailureStatusHUD
{
    [JLProgressHUD showAnimationWithStatus:@"正在领取"];
     
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
     {
     
         [JLProgressHUD showAnimationFailureWithStatus:@"领取失败" animated:YES];
     
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
         {
             [JLProgressHUD dismiss];
         });
     });
}

- (void)AnimationSuccessStatusHUD
{
    [JLProgressHUD showAnimationWithStatus:@"正在领取"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        [JLProgressHUD showAnimationSuccessWithStatus:@"领取成功" animated:YES];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
        {
            [JLProgressHUD dismiss];
        });
    });
}

#pragma mark - tableView   Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.methodArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KJHKTableViewCell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KJHKTableViewCell"];
    }
    
    if (self.methodArray.count > indexPath.row)
    {
        cell.textLabel.text = self.methodArray[indexPath.row];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.methodArray.count > indexPath.row)
    {
        NSString * selector = self.methodArray[indexPath.row];
        [self performSelectorOnMainThread:NSSelectorFromString(selector) withObject:nil waitUntilDone:NO];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
