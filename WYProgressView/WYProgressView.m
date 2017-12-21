//
//  WYProgressView.m
//  WYPorgressViewDemo
//
//  Created by YANGGL on 2017/12/21.
//  Copyright © 2017年 YANGGL. All rights reserved.
//

#import "WYProgressView.h"

@interface WYProgressView()

@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@property (nonatomic, strong) CAShapeLayer *circle;

@end

@implementation WYProgressView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonInit];
}

- (void)commonInit {
    self.backgroundColor = WYBackgroundColor;
}

- (void)drawRect:(CGRect)rect {
    [[UIColor whiteColor] set];
    UIRectFill(rect);
    
    [WYColorRGBA(180, 180, 180, 0.8) set];
    UIRectFrame(CGRectMake(0, 0, rect.size.width * self.progress, rect.size.height));
    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//
//    CGFloat xCenter = rect.size.width * 0.5;
//    CGFloat yCenter = rect.size.height * 0.5;
//    [[UIColor whiteColor] set];
//
//    CGContextSetLineWidth(ctx, 15 * (MIN(self.frame.size.width, self.frame.size.height) / 100.0));
//    CGContextSetLineCap(ctx, kCGLineCapRound);
//    CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.05; // 初始值0.05
//    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - WYItemMargin;
//    CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
//    CGContextStrokePath(ctx);
    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//
//    CGFloat xCenter = rect.size.width * 0.5;
//    CGFloat yCenter = rect.size.height * 0.5;
//
//    CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - WYItemMargin;
//
//    // 背景圆
//    [WYColorRGBA(240, 240, 240, 1) set];
//    CGFloat w = radius * 2 + 4;
//    CGFloat h = w;
//    CGFloat x = (rect.size.width - w) * 0.5;
//    CGFloat y = (rect.size.height - h) * 0.5;
//    CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
//    CGContextFillPath(ctx);
//
//    // 进程圆
//    [WYColorRGBA(100, 100, 100, 0.8) set];
//    CGContextMoveToPoint(ctx, xCenter, yCenter);
//    CGContextAddLineToPoint(ctx, xCenter, 0);
//    CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; // 初始值
//    CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 1);
//    CGContextClosePath(ctx);
//
//    CGContextFillPath(ctx);

}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    dispatch_async(dispatch_get_main_queue(), ^{
//        if (progress >= 1.0) {
//            [self removeFromSuperview];
//        } else {
            [self setNeedsDisplay];
//        }
    });
}

@end
