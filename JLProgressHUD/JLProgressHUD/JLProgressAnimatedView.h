//
//  JLProgressAnimatedView.h
//  JLProgressHUD
//
//  Created by smalltsky on 2018/1/2.
//  Copyright (c) 2017-2018 smalltsky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,JLProgressAnimatedViewType)
{
    JLProgressAnimatedViewTypeNormal = 1 << 0,
    JLProgressAnimatedViewTypeSmall = 1 << 1,
};

@interface JLProgressAnimatedView : UIView

-(instancetype)initWithType:(JLProgressAnimatedViewType)type;

@property (assign,nonatomic)CGFloat progress;
@property (strong,nonatomic)UIColor * progressColor;
@property (strong,nonatomic)UIColor * progressBackgroundColor;
@property (strong,nonatomic,readonly)UILabel * progressLabel;

@end
