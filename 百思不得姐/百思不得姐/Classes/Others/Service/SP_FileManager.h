//
//  SP_FileManager.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/8.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SP_FileManager : NSObject

/**
 获取文件缓存大小

 @param directoryPath 文件夹全路径
 @return 文件大小
 */
+(NSInteger)getDirectorySize:(NSString *)directoryPath;

/**
 删除文件夹下所有的文件

 @param directoryPath 文件夹全路径
 */
+ (void)removeDirectoryPath:(NSString *)directoryPath;
@end
