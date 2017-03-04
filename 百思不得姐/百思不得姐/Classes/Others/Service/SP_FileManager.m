//
//  SP_FileManager.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/8.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_FileManager.h"

@implementation SP_FileManager
+(NSInteger)getDirectorySize:(NSString *)directoryPath{
//    0、获取文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
//    1、判断是否目标文件夹
    BOOL isDirectory;
    BOOL isExist = [manager fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if (!isExist || !isDirectory) {
//        抛出异常
        NSException *exception = [NSException exceptionWithName:@"filePathError" reason:@"路径错误" userInfo:nil];
        [exception raise];
    }
//    2、获取文件夹下所有的文件
    NSArray *subFiles = [manager subpathsAtPath:directoryPath];
    NSInteger totalSize = 0;
    for (NSString *subFile in subFiles) {
//        拼接文件全路径
        NSString *filePath = [directoryPath stringByAppendingPathComponent:subFile];
//        排除文件夹
        BOOL isDirectory;
        BOOL isExist = [manager fileExistsAtPath:filePath isDirectory:&isDirectory];
        if (!isExist || isDirectory) continue;
//        排除隐藏文件
        if ([filePath containsString:@".DS"]) continue;
        // 指定路径获取这个路径的属性
        // attributesOfItemAtPath:只能获取文件属性
        NSDictionary *attri = [manager attributesOfItemAtPath:filePath error:nil];
        totalSize += [attri fileSize];
    }
    return totalSize;
}
+ (void)removeDirectoryPath:(NSString *)directoryPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL isExist = [manager fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    if (!isExist || !isDirectory) {
        // 报错:抛异常
        NSException *excp = [NSException exceptionWithName:@"filePathError" reason:@"传错,必须传文件夹路径" userInfo:nil];
        
        [excp raise];
    }
    NSArray *subPaths = [manager contentsOfDirectoryAtPath:directoryPath error:nil];
    for (NSString *subPath in subPaths) {
        NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
        [manager removeItemAtPath:filePath error:nil];
    }
    
}
@end
