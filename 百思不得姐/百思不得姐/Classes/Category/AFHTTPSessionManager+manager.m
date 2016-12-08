//
//  AFHTTPSessionManager+manager.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/8.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "AFHTTPSessionManager+manager.h"

@implementation AFHTTPSessionManager (manager)

+(instancetype)SP_manager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    return manager;
}

- (NSURLSessionDataTask *)SP_GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    
    return [self GET:URLString parameters:parameters progress:nil success:success failure:failure];
}

- (NSURLSessionDataTask *)SP_POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    return [self POST:URLString parameters:parameters progress:nil success:success failure:failure];
}

@end
