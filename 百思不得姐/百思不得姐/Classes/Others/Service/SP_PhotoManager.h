//
//  SP_PhotoManager.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/13.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SP_PhotoManager : NSObject
+(void)saveImage:(UIImage *)image toCollection:(NSString *)title CompletionHandler:(void(^)(BOOL success,NSError *error))CompletionHandler;
@end
