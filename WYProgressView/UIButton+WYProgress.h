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

@end
