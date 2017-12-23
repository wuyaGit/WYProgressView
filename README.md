# WYProgressView
集成与UIButton的进度控件。

# 1、导入说明
（1）支持pod导入
pod 'WYProgressView','~> 0.0.2'

（2）直接下载源码，导入项目

![示例1 ](https://github.com/wuyaGit/WYProgressView/blob/master/DesignIMG/2803B04D-E3CA-4DF1-A458-0F1C28C48C39.png)

# 2、使用说明
（1）使用xib或storyboard创建
![示例2 ](https://github.com/wuyaGit/WYProgressView/blob/master/DesignIMG/FB02A7CA-DE8B-4882-B8C7-E1AA1CFEA6E4.png)

（2）使用代码创建

    [self.view addSubview:self.btnProgressView3];

    - (UIButton *)btnProgressView3 {
    
      if (!_btnProgressView3) {
        
          _btnProgressView3 = [UIButton buttonWithFrame:CGRectMake(0, 510, 160, 160)
                                       wyProgressView:YES
                               wyProgressViewProperty:@{kProgressViewStrokeColor: WYColorRGBA(260, 260, 260, 0.6),
                                                        kProgressViewFillColor: [UIColor whiteColor],
                                                        kProgressViewFontColor: [UIColor whiteColor],
                                                        kProgressViewType: @(WYProgressViewTypeHollow)}];
          _btnProgressView3.center = CGPointMake(self.view.center.x, _btnProgressView3.center.y);
       }
    
       return _btnProgressView3;
    }

（3）点击事件
  
    self.btnProgressView3.handel = ^(UIButton *btn) {
        
        _btn3ProgressStop = !_btn3ProgressStop;
    };
  
# 3、效果图
![示例3](https://github.com/wuyaGit/WYProgressView/blob/master/DesignIMG/progressview.gif)

