//
//  ViewController.m
//  WYPorgressViewDemo
//
//  Created by YANGGL on 2017/12/21.
//  Copyright © 2017年 YANGGL. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+WYProgress.h"
#import "WYProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonProgressView;
@property (weak, nonatomic) IBOutlet WYProgressView *progressView;

@property (nonatomic, assign) BOOL btnProgressStop;
@property (nonatomic, assign) BOOL btn1ProgressStop;
@property (nonatomic, assign) BOOL btn2ProgressStop;
@property (nonatomic, assign) BOOL btn3ProgressStop;

@property (nonatomic, strong) UIButton *btnProgressView1;
@property (nonatomic, strong) UIButton *btnProgressView2;
@property (nonatomic, strong) UIButton *btnProgressView3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupView];
    
    self.buttonProgressView.handel = ^(UIButton *button) {
        _btnProgressStop = !_btnProgressStop;
    };
    self.btnProgressView1.handel = ^(UIButton *btn) {
        _btn1ProgressStop = !_btn1ProgressStop;
    };
    self.btnProgressView2.handel = ^(UIButton *btn) {
        _btn2ProgressStop = !_btn2ProgressStop;
    };
    self.btnProgressView3.handel = ^(UIButton *btn) {
        _btn3ProgressStop = !_btn3ProgressStop;
    };
    self.progressView.fontColor = [UIColor purpleColor];

   
    //下载进度
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(run:) userInfo:self repeats:YES];
}

- (void)setupView {
    [self.view addSubview:self.btnProgressView1];
    [self.view addSubview:self.btnProgressView2];
    [self.view addSubview:self.btnProgressView3];
}

- (void)run:(id)sender {
    static CGFloat progress = 0;
    
    if (progress < 1.0) {
        progress += 0.01;
        
        // 循环
        if (progress >= 1.0) progress = 0;
        
        self.progressView.progress = progress;

        _btnProgressStop ? self.buttonProgressView.progress += 0.01 : 0.0;
        _btn1ProgressStop ? self.btnProgressView1.progress += 0.01 : 0.0;
        _btn2ProgressStop ? self.btnProgressView2.progress += 0.01 : 0.0;
        _btn3ProgressStop ? self.btnProgressView3.progress += 0.01 : 0.0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter

- (UIButton *)btnProgressView1 {
    if (!_btnProgressView1) {
        _btnProgressView1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 240, 200, 50) wyProgressView:YES];
        _btnProgressView1.center = CGPointMake(self.view.center.x, _btnProgressView1.center.y);
        _btnProgressView1.wyProgressViewProperty = @{kProgressViewStrokeColor: WYColorRGBA(210, 210, 210, 1),
                                                     kProgressViewFontColor: [UIColor blueColor]};
    }
    
    return _btnProgressView1;
}

- (UIButton *)btnProgressView2 {
    if (!_btnProgressView2) {
        _btnProgressView2 = [UIButton buttonWithFrame:CGRectMake(0, 326, 160, 160)
                                       wyProgressView:YES
                               wyProgressViewProperty:@{kProgressViewFontColor: [UIColor blueColor],
                                                        kProgressViewType: @(WYProgressViewTypeCircle)}];
        _btnProgressView2.center = CGPointMake(self.view.center.x, _btnProgressView2.center.y);
    }
    
    return _btnProgressView2;
}

- (UIButton *)btnProgressView3 {
    if (!_btnProgressView3) {
        _btnProgressView3 = [UIButton buttonWithFrame:CGRectMake(0, 326, 160, 160)
                                       wyProgressView:YES
                               wyProgressViewProperty:@{kProgressViewStrokeColor: WYColorRGBA(260, 260, 260, 0.6),
                                                        kProgressViewFillColor: [UIColor whiteColor],
                                                        kProgressViewFontColor: [UIColor whiteColor],
                                                        kProgressViewType: @(WYProgressViewTypeHollow)}];
        _btnProgressView3.center = CGPointMake(self.view.center.x, _btnProgressView3.center.y);
    }
    
    return _btnProgressView3;
}

@end
