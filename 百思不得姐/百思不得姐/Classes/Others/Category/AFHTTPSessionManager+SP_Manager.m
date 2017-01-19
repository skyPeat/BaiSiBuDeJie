//
//  AFHTTPSessionManager+SP_Manager.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/21.
//  Copyright © 2016年 tianfeng pan. All rights reserved.
//

#import "AFHTTPSessionManager+SP_Manager.h"

@implementation AFHTTPSessionManager (SP_Manager)
+(instancetype)SP_manager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    return manager;
}

- (NSURLSessionDataTask *)SP_GET:(NSString *)URLString
                      parameters:(nullable id)parameters
                        progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                         success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                         failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure{
   return [self GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
}

- (NSURLSessionDataTask *)SP_POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure{
    return [self POST:URLString parameters:parameters progress:uploadProgress success:success failure:failure];
}
@end
