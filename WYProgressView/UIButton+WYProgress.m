//
//  UIButton+WYProgress.m
//  WYPorgressViewDemo
//
//  Created by YANGGL on 2017/12/21.
//  Copyright © 2017年 YANGGL. All rights reserved.
//

#import "UIButton+WYProgress.h"
#import <objc/runtime.h>

static const void *handelKey = &handelKey;
static const void *wyProgressViewKey = &wyProgressViewKey;
static const void *progressKey = &progressKey;

@implementation UIButton (WYProgress)

#pragma mark - init

/**
 * 通过代码初始化
 */
- (instancetype)initWithFrame:(CGRect)frame wyProgressView:(BOOL)wyProgressView {
    self = [super init];
    if (self) {
        
    }
    
    if (wyProgressView) {
        [self addTarget:self action:@selector(onTouchClickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

/**
 * 在通过xib/Storyboard 创建控件时调用，在所有控件全部加载完成后调用
 */
- (void)awakeFromNib {
    [super awakeFromNib];
    
    //设置wyProgressViews属性后，该Button为ProgressView
    if (self.wyProgressView) {
        //添加button事件。也可以
        [self addTarget:self action:@selector(onTouchClickAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
}

#pragma mark - touch methods

- (void)onTouchClickAction:(id)sender {
    if (self.handel) {
        self.handel(self);
    }
}

#pragma mark - runtime property

- (void)setHandel:(onTouchClickHandel)handel {
    [self willChangeValueForKey:@"handelKey"];
    objc_setAssociatedObject(self, handelKey, handel, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"handelKey"];
}

- (onTouchClickHandel)handel {
    return objc_getAssociatedObject(self, handelKey);
}

- (void)setWyProgressView:(BOOL)wyProgressView {
    [self willChangeValueForKey:@"wyProgressViewKey"];
    objc_setAssociatedObject(self, wyProgressViewKey, @(wyProgressView), OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"wyProgressViewKey"];
    
    if (wyProgressView) {
        
    }
}

- (BOOL)wyProgressView {
    return [objc_getAssociatedObject(self, wyProgressViewKey) boolValue];
}

- (void)setProgress:(CGFloat)progress {
    [self willChangeValueForKey:@"progressKey"];
    objc_setAssociatedObject(self, progressKey, @(progress), OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"progressKey"];
}

- (CGFloat)progress {
    return [objc_getAssociatedObject(self, progressKey) floatValue];
}

@end
