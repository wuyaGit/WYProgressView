//
//  WYProgressView.h
//  WYPorgressViewDemo
//
//  Created by YANGGL on 2017/12/21.
//  Copyright © 2017年 YANGGL. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WYItemMargin 10
#define WYColorRGBA(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

static const NSString *kProgressViewBgColor = @"org.wyprogressview.kProgressViewBgColor";
static const NSString *kProgressViewStrokeColor = @"org.wyprogressview.kProgressViewProColor";
static const NSString *kProgressViewFillColor = @"org.wyprogressview.kProgressViewFillColor";
static const NSString *kProgressViewFontColor = @"org.wyprogressview.kProgressViewFontColor";
static const NSString *kProgressViewFontName = @"org.wyprogressview.kProgressViewFontName";
static const NSString *kProgressViewHasText = @"org.wyprogressview.kProgressViewHasText";
static const NSString *kProgressViewType = @"org.wyprogressview.kProgressViewType";

typedef NS_ENUM(NSInteger, WYProgressViewType) {
    WYProgressViewTypeNormal            = 0,    //长条形
    WYProgressViewTypeCircle,                   //圆形
    WYProgressViewTypeHollow                    //环形
};


@interface WYProgressView : UIView

// 类型
@property (nonatomic, assign) WYProgressViewType progressViewType;

// 进度
@property (nonatomic, assign) CGFloat progress;

// 进度颜色值
@property (nonatomic, strong) UIColor *fillColor;
// 边框颜色值
@property (nonatomic, strong) UIColor *strokeColor;
// 背景颜色值
@property (nonatomic, strong) UIColor *bgroundColor;

// 是否有进度数字
@property (nonatomic, getter=isHasProgressText, assign) BOOL hasProgressText;
// 进度数字体颜色
@property (nonatomic, strong) UIColor *fontColor;
// 进度数字体名
@property (nonatomic, strong) UIFont *fontName;

// 参数集合
@property (nonatomic, strong) NSDictionary *parameter;

@end
