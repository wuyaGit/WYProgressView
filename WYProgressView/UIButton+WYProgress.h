//
//  UIButton+WYProgress.h
//  WYPorgressViewDemo
//
//  Created by YANGGL on 2017/12/21.
//  Copyright © 2017年 YANGGL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYProgressView.h"

typedef void (^onTouchClickHandel)(UIButton *);

@interface UIButton (WYProgress)

@property (nonatomic, copy) onTouchClickHandel handel;
@property (nonatomic, strong) WYProgressView *progressView;
@property (nonatomic, assign) BOOL wyProgressView;
@property (nonatomic, assign) CGFloat progress;

// 参数集合
@property (nonatomic, strong) NSDictionary *wyProgressViewProperty;

- (instancetype)initWithFrame:(CGRect)frame wyProgressView:(BOOL)wyProgressView;

+ (instancetype)buttonWithFrame:(CGRect)frame wyProgressView:(BOOL)wyProgressView;
+ (instancetype)buttonWithFrame:(CGRect)frame
                 wyProgressView:(BOOL)wyProgressView
         wyProgressViewProperty:(NSDictionary *)parameters;

@end
