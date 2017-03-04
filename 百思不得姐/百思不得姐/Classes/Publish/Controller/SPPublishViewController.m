//
//  SPPublishViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPPublishViewController.h"

@interface SPPublishViewController ()

@end

@implementation SPPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
self.view.backgroundColor = SP_RandomColor;
   
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
