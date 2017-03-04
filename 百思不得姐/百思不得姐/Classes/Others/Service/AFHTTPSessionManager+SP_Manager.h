//
//  AFHTTPSessionManager+SP_Manager.h
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/21.
//  Copyright © 2016年 tianfeng pan. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHTTPSessionManager (SP_Manager)

/**
 封装一个自定义的网络请求管理者

 @return 返回一个请求管理者
 */
+(instancetype)SP_manager;

//基于AFN的GET方法封装一个自己的GET方法

- ( NSURLSessionDataTask *)SP_GET:(NSString *)URLString
                            parameters:( id)parameters
                              progress:( void (^)(NSProgress *downloadProgress))downloadProgress
                               success:( void (^)(NSURLSessionDataTask *task, id  responseObject))success
                               failure:( void (^)(NSURLSessionDataTask *  task, NSError *error))failure;

//  基于AFN的POS方法封装一个自己的POS方法
- ( NSURLSessionDataTask *)SP_POST:(NSString *)URLString
                             parameters:( id)parameters
                               progress:( void (^)(NSProgress *uploadProgress))uploadProgress
                                success:( void (^)(NSURLSessionDataTask *task, id  responseObject))success
                                failure:( void (^)(NSURLSessionDataTask *  task, NSError *error))failure;;
@end
