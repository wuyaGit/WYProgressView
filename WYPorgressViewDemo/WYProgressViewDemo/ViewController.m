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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //
    self.buttonProgressView.handel = ^(UIButton *button) {
        _btnProgressStop = !_btnProgressStop;
    };
    
    //添加progressView
    
   
    //下载进度
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(run:) userInfo:self repeats:YES];
}

- (void)setupView {
    
}

- (void)run:(id)sender {
    static CGFloat progress = 0;
    
    if (progress < 1.0) {
        progress += 0.01;
        
        // 循环
        if (progress >= 1.0) progress = 0;
        
        self.progressView.progress = progress;
        _btnProgressStop ? self.buttonProgressView.progress += 0.01 : 0.0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
