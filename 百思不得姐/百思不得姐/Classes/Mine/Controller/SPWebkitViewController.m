//
//  SPWebkitViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/5.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPWebkitViewController.h"
#import <WebKit/WebKit.h>
@interface SPWebkitViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;
@property(nonatomic,weak) WKWebView *webkitView;
@end

@implementation SPWebkitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    0、添加webkitView
    [self addWebkitView];
}
-(void)addWebkitView{
    WKWebView *webkitView = [[WKWebView alloc] initWithFrame:SP_ScreenBounds];
    self.webkitView = webkitView;
    NSURLRequest *requst = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.url]];
    [webkitView loadRequest:requst];
}
- (IBAction)backClick:(UIBarButtonItem *)sender {
    if ([self.webkitView canGoBack]) {
        [self.webkitView goBack];
    }
}
- (IBAction)forwardClick:(UIBarButtonItem *)sender {
    if ([self.webkitView canGoForward]) {
        [self.webkitView goForward];
    }
}
- (IBAction)refresh:(UIBarButtonItem *)sender {
    [self.webkitView reload];
}
@end
