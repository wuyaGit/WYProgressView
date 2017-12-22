//
//  UIButton+WYProgress.m
//  WYPorgressViewDemo
//
//  Created by YANGGL on 2017/12/21.
//  Copyright © 2017年 YANGGL. All rights reserved.
//

#import "UIButton+WYProgress.h"
#import <objc/runtime.h>

static const void *progressViewKey = &progressViewKey;
static const void *handelKey = &handelKey;
static const void *wyProgressViewKey = &wyProgressViewKey;
static const void *progressKey = &progressKey;
static const void *wyProgressViewPropertyKey = &wyProgressViewPropertyKey;

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
        [self commonInit];
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
        [self commonInit];
    }
}

- (void)commonInit {
    //添加button事件。也可以
    [self addTarget:self action:@selector(onTouchClickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.progressView = [[WYProgressView alloc] initWithFrame:self.bounds];
    self.progressView.userInteractionEnabled = NO;
    [self addSubview:self.progressView];
    
    self.progress = 0.0;

}

- (void)deInit {
    [self.progressView removeFromSuperview];
    self.progressView = nil;
    
    self.handel = nil;
}

#pragma mark - touch methods

- (void)onTouchClickAction:(id)sender {
    if (self.handel) {
        self.handel(self);
    }
}

#pragma mark - runtime property

- (void)setProgressView:(WYProgressView *)progressView {
    [self willChangeValueForKey:@"progressViewKey"];
    objc_setAssociatedObject(self, progressViewKey, progressView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"progressViewKey"];
}

- (WYProgressView *)progressView {
    return objc_getAssociatedObject(self, progressViewKey);
}

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
    objc_setAssociatedObject(self, wyProgressViewKey, @(wyProgressView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"wyProgressViewKey"];
    
    if (wyProgressView) {
        if (self.progressView == nil) {
            [self commonInit];
        }
    }else {
        if (self.progressView) {
            [self deInit];
        }
    }
}

- (BOOL)wyProgressView {
    return [objc_getAssociatedObject(self, wyProgressViewKey) boolValue];
}

- (void)setProgress:(CGFloat)progress {
    [self willChangeValueForKey:@"progressKey"];
    objc_setAssociatedObject(self, progressKey, [NSNumber numberWithFloat:progress], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"progressKey"];
    
    if (progress > 1) {
        self.progress = 0;
    }
    if (self.wyProgressView) {
        self.progressView.progress = progress;
    }
}

- (CGFloat)progress {
    return [objc_getAssociatedObject(self, progressKey) floatValue];
}

- (void)setWyProgressViewProperty:(NSDictionary *)wyProgressViewProperty {
    [self willChangeValueForKey:@"wyProgressViewKey"];
    objc_setAssociatedObject(self, wyProgressViewPropertyKey, wyProgressViewProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"wyProgressViewKey"];
    
    if (self.wyProgressView) {
        self.progressView.parameter = wyProgressViewProperty;
    }
}

- (NSDictionary *)wyProgressViewProperty  {
    return objc_getAssociatedObject(self, wyProgressViewPropertyKey);
}

@end
