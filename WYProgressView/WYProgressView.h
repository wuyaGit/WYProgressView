//
//  WYProgressView.h
//  WYPorgressViewDemo
//
//  Created by YANGGL on 2017/12/21.
//  Copyright © 2017年 YANGGL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WYProgressViewType) {
    WYProgressViewTypeNormal            = 0,    //长条形
    WYProgressViewTypeCircle,                   //圆形
    WYProgressViewTypeHollow                    //环形
};

#define WYItemMargin 10
#define WYBackgroundColor [UIColor clearColor]
#define WYColorRGBA(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

@interface WYProgressView : UIView

@property (nonatomic, assign) CGFloat progress;

@end
