//
//  ViewController.m
//  TT
//
//  Created by 张福润 on 2017/2/27.
//  Copyright © 2017年 张福润. All rights reserved.
//

#import "ViewController.h"

#import "TTHUDMessage.h"

#import "TTConst.h"

#import "HyperlinkButton.h"
#import "TTBottomBarView.h"

#import "UIView+TTSuperView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HyperlinkButton *button = [HyperlinkButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(onHyperlinkBtnTap) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"你点啊" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:button];
    
    TTBottomBarView *barView = [[TTBottomBarView alloc] initWithFrame:CGRectMake(0, KEY_WINDOW.height - 44, KEY_WINDOW.width, 44)];
    barView.backgroundColor = [UIColor yellowColor];
    [barView showInView:self.view];
    
}

- (void)onHyperlinkBtnTap {
    NSLog(@"点击了");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)on:(id)sender {
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        [self doSomeWorkWithProgress];
        
    });
}

- (void)doSomeWorkWithProgress {
    
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        [TTHUDMessage showInView:self.view showText:@"下载中" progress:progress withProgressType:HUDShowProgressTypeAnnularDeterminate];
        usleep(50000);
    }
}

@end
