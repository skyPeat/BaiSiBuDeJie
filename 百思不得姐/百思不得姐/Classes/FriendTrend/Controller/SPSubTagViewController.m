//
//  SPSubTagViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/19.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPSubTagViewController.h"

@interface SPSubTagViewController ()

@end

@implementation SPSubTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    0、请求数据
    [self loadData];
}
-(void)loadData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager SP_manager];
    NSDictionary *parameter = @{
                                @"a":@"tags_list",
                                @"c":@"subscribe"
                                };
    NSString *urlString = SP_MainUrl;
    [manager SP_GET:urlString parameters:parameter progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [responseObject writeToFile:@"/Users/tianfengpan/Desktop/app.plist" atomically:YES];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}
@end
