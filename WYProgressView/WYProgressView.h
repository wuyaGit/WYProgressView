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

@interface WYProgressView : UIView

@end
