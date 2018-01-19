# JLProgressHUD

![Pod Version](https://img.shields.io/cocoapods/v/JLProgressHUD.svg?style=flat)
![Pod Platform](https://img.shields.io/cocoapods/p/JLProgressHUD.svg?style=flat)
![Pod License](https://img.shields.io/cocoapods/l/JLProgressHUD.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


JLProgressHUD added more color chrysanthemum, can be custom color chrysanthemum Only can be used on the iOS
JLProgressHUD添加了多颜色菊花，可以自定义菊花颜色 只可以在iOS上使用

![JLProgressHUD](http://zjb.kuaijielife.com/Uploads/Upicture/lqt/JLProgressHUD0.gif)
![JLProgressHUD](http://zjb.kuaijielife.com/Uploads/Upicture/lqt/JLProgressHUD1.gif)


## Demo		

Try  'JLProgressHUD' on [JLProgressHUD.zip](https://github.com/smalltsky/JLProgressHUD/archive/master.zip)

下载 'JLProgressHUD' 请点击 [JLProgressHUD.zip](https://github.com/smalltsky/JLProgressHUD/archive/master.zip)

## Installation 

### From CocoaPods 

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like `JLProgressHUD` in your projects. First, add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```ruby
pod 'JLProgressHUD'
```

## Usage

(see sample Xcode project in `/Demo`)

`JLProgressHUD` is created as a singleton (i.e. it doesn't need to be explicitly allocated and instantiated; you directly call `[JLProgressHUD method]`).

### method

```objective-c
//默认 为黑色
@property (nonatomic,assign) JLProgressHUDNormalColorType colorType;
//默认 为白色
@property (nonatomic,assign) JLProgressHUDStyleType styleType;
//默认 JLProgressHUDStandardWidthTypeNormal
@property (nonatomic,assign) JLProgressHUDStandardWidthType standardWidthType;
//默认 为14.0
@property (nonatomic,strong) UIFont *statusFont;
//默认 为灰色 只有JLProgressHUDType类型为JLProgressHUDTypeProgress时有用
@property (nonatomic,strong) UIColor *allProgressColor;
//默认 为红色 只有JLProgressHUDType类型为JLProgressHUDTypeProgress时有用
@property (nonatomic,strong) UIColor *noAllProgressColor;

//默认 为27x27
@property (nonatomic,assign) CGSize imageViewSize UI_APPEARANCE_SELECTOR;

+ (JLProgressHUD *)sharedView;

+ (void)showWithStatus:(NSString*)status;

+ (void)showInfoWithStatus:(NSString *)status;
+ (void)showSuccessWithStatus:(NSString *)status;
+ (void)showFailureWithStatus:(NSString *)status;

+ (void)showWithImage:(UIImage *)image Status:(NSString *)status;
+ (void)showWithProgress:(NSNumber *)progress Status:(NSString *)status;

+ (void)showProgress:(JLProgressHUDType)type status:(NSString *)status colors:(NSArray *)colors Progress:(NSNumber *)progress image:(UIImage *)image;

- (void)showProgress:(JLProgressHUDType)type status:(NSString *)status colors:(NSArray *)colors Progress:(NSNumber *)progress image:(UIImage *)image;

+ (void)dismiss;
+ (void)dismissWithDelay:(NSTimeInterval)delay;

- (void)dismiss;
- (void)dismissWithDelay:(NSTimeInterval)delay;
```

### custom method

```objective-c
JLProgressHUD *progress = [JLProgressHUD sharedView];
[progress setStandardWidthType:JLProgressHUDStandardWidthTypeSmall];
[progress setColorType:JLProgressHUDNormalColorTypeColor];
[progress setStyleType:JLProgressHUDStyleTypeBlack];
[progress showProgress:JLProgressHUDTypeNormal status:@"加载中..." colors:nil Progress:nil image:nil];
```

