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
    self.bgroundColor = [UIColor clearColor];
    self.strokeColor = WYColorRGBA(210, 210, 210, 1);
    self.fillColor = WYColorRGBA(100, 100, 100, 0.6);

    self.fontName = [UIFont systemFontOfSize:16];
    self.fontColor = WYColorRGBA(60, 60, 60, 1);
    
    self.progressViewType = WYProgressViewTypeNormal;
    self.progress = 0.f;
    self.hasProgressText = YES;
}

- (void)drawRect:(CGRect)rect {
    switch (_progressViewType) {
        case WYProgressViewTypeNormal:
        {
            CGContextRef ctx = UIGraphicsGetCurrentContext();
            
            CGFloat width = rect.size.width;
            CGFloat height = rect.size.height;
            CGFloat radius = MIN(width, height) * 0.18;
            CGFloat margin = MIN(width, height) * 0.18;
            
            // 背景矩形
            [self.strokeColor set];
            CGContextMoveToPoint(ctx, width, height - margin); // 起点
            CGContextAddArcToPoint(ctx, width, height, width - margin, height, radius);   // 右下角
            CGContextAddArcToPoint(ctx, 0, height, 0, height - margin, radius);              // 左下角
            CGContextAddArcToPoint(ctx, 0, 0, width - margin, 0, radius);                      // 左上角
            CGContextAddArcToPoint(ctx, width, 0, width, height - margin, radius);          // 右上角
            CGContextClosePath(ctx);
            CGContextDrawPath(ctx, kCGPathFillStroke);
            
            CGFloat to = self.progress * width;
            // 进程矩形
            [self.fillColor set];
            CGContextMoveToPoint(ctx, 0, height - margin); // 起点
            if (margin >= to) {
                CGContextAddArcToPoint(ctx, 0, height, to - margin, height, radius);
                CGContextAddArcToPoint(ctx, to, height, to, height - margin, radius);
                CGContextAddArcToPoint(ctx, to, 0, to - margin, 0, radius);
                CGContextAddArcToPoint(ctx, 0, 0, 0, height - margin, radius);
            }else {
                CGContextAddArcToPoint(ctx, 0, height, margin, height, radius);             // 左下角
                CGContextAddArcToPoint(ctx, to, height, to, height - margin, radius);       // 右下角
                CGContextAddArcToPoint(ctx, to, 0, margin, 0, radius);                          // 右上角
                CGContextAddArcToPoint(ctx, 0, 0, 0, height - margin, radius);                 // 左上角
            }
            CGContextClosePath(ctx);
            CGContextDrawPath(ctx, kCGPathFillStroke);
        }
            break;
            
        case WYProgressViewTypeCircle:
        {
            CGContextRef ctx = UIGraphicsGetCurrentContext();
            
            CGFloat xCenter = rect.size.width * 0.5;
            CGFloat yCenter = rect.size.height * 0.5;
            
            CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - WYItemMargin;
            
            // 背景圆
            [self.strokeColor set];
            CGFloat w = radius * 2 + 4;
            CGFloat h = w;
            CGFloat x = (rect.size.width - w) * 0.5;
            CGFloat y = (rect.size.height - h) * 0.5;
            CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
            CGContextFillPath(ctx);
            
            // 进程圆
            [self.fillColor set];
            CGContextMoveToPoint(ctx, xCenter, yCenter);
            CGContextAddLineToPoint(ctx, xCenter, 0);
            CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; // 初始值
            CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 1);
            CGContextClosePath(ctx);
            
            CGContextFillPath(ctx);

        }
            break;
        case WYProgressViewTypeHollow:
        {
            CGContextRef ctx = UIGraphicsGetCurrentContext();
            
            CGFloat xCenter = rect.size.width * 0.5;
            CGFloat yCenter = rect.size.height * 0.5;
            CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - WYItemMargin;

            [self.strokeColor set];
            CGContextSetLineWidth(ctx, 13 * (MIN(rect.size.width, rect.size.height) / 100.0));
            CGContextSetLineCap(ctx, kCGLineCapRound);
            CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, M_PI * 2, 0);
            CGContextStrokePath(ctx);
            
            [self.fillColor set];
            CGContextSetLineWidth(ctx, 13 * (MIN(rect.size.width, rect.size.height) / 100.0));
            CGContextSetLineCap(ctx, kCGLineCapRound);
            CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.01; // 初始值0.05
            CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
            CGContextStrokePath(ctx);

        }
            break;
    }
    
    if (self.isHasProgressText) {
        // 进度数字
        NSString *progressStr = [NSString stringWithFormat:@"%.0f", self.progress * 100];
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSFontAttributeName] = self.fontName;
        attributes[NSForegroundColorAttributeName] = self.fontColor;
        
        [self setProgressText:progressStr withAttributes:attributes];
    }
}

#pragma mark - private

- (void)setProgressText:(NSString *)text withAttributes:(NSDictionary *)attributes
{
    CGFloat xCenter = self.frame.size.width * 0.5;
    CGFloat yCenter = self.frame.size.height * 0.5;
    
    CGSize strSize = [text sizeWithAttributes:attributes];
    CGFloat strX = xCenter - strSize.width * 0.5;
    CGFloat strY = yCenter - strSize.height * 0.5;
    [text drawAtPoint:CGPointMake(strX, strY) withAttributes:attributes];
}

#pragma mark - setter

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setNeedsDisplay];
    });
}

- (void)setBgroundColor:(UIColor *)bgroundColor {
    self.backgroundColor = bgroundColor;
}

- (void)setParameter:(NSDictionary *)parameter {
    if ([parameter objectForKey:kProgressViewBgColor] &&
        [[parameter objectForKey:kProgressViewBgColor] isKindOfClass:[UIColor class]]) {
        self.bgroundColor = parameter[kProgressViewBgColor];
    }
    
    if ([parameter objectForKey:kProgressViewStrokeColor] &&
        [[parameter objectForKey:kProgressViewStrokeColor] isKindOfClass:[UIColor class]]) {
        self.strokeColor = parameter[kProgressViewStrokeColor];
    }
    
    if ([parameter objectForKey:kProgressViewFillColor] &&
        [[parameter objectForKey:kProgressViewFillColor] isKindOfClass:[UIColor class]]) {
        self.fillColor = parameter[kProgressViewFillColor];
    }
    
    if ([parameter objectForKey:kProgressViewFontColor] &&
        [[parameter objectForKey:kProgressViewFontColor] isKindOfClass:[UIColor class]]) {
        self.fontColor = parameter[kProgressViewFontColor];
    }
    
    if ([parameter objectForKey:kProgressViewFontName] &&
        [[parameter objectForKey:kProgressViewFontName] isKindOfClass:[UIFont class]]) {
        self.fontName = parameter[kProgressViewFontName];
    }
    
    if ([parameter objectForKey:kProgressViewHasText] &&
        [[parameter objectForKey:kProgressViewHasText] isKindOfClass:[NSNumber class]]) {
        self.hasProgressText = [parameter[kProgressViewHasText] boolValue];
    }

    if ([parameter objectForKey:kProgressViewType] &&
        [[parameter objectForKey:kProgressViewType] isKindOfClass:[NSNumber class]]) {
        self.progressViewType = [parameter[kProgressViewType] integerValue];
    }

}

@end
