//
//  AFHTTPSessionManager+manager.h
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/8.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHTTPSessionManager (manager)
/**
 *  封装网络请求管理者
 *
 *  @return SP_manager
 */
+(instancetype)SP_manager;
/**
 *  基于AFN的GET方法封装一个自己的GET方法
 *
 *  @param URLString        设置请求路径
 *  @param parameters       拼接请求参数
 *  @param downloadProgress 下载进度
 *  @param success          加载成功
 *  @param failure          加载失败
 *
 *  @return 返回一个GET请求
 */
- (NSURLSessionDataTask *)SP_GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
/**
 *  基于AFN的POS方法封装一个自己的POS方法
 *
 *  @param URLString  设置请求路径
 *  @param parameters 拼接请求参数
 *  @param success    加载成功
 *  @param failure    加载失败
 *
 *  @return 返回一个POST请求
 */
- (NSURLSessionDataTask *)SP_POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
