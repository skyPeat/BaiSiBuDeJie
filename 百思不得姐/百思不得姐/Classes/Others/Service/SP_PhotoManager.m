//
//  SP_PhotoManager.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/13.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_PhotoManager.h"
#import <Photos/Photos.h>
@implementation SP_PhotoManager

/*
 PHAsset:代表一张照片
 PHAssetCollection:相册
 PHFetchResult:
 PHAssetChangeRequest: 可以对相片进行创建,修改,删除
 PHAssetCollectionChangeRequest: 可以对相册进行创建,修改,删除
 */
//保存相片到自己的相册
//保存相片
//创建一个相册
//引用相片到相册

+(void)saveImage:(UIImage *)image toCollection:(NSString *)title CompletionHandler:(void(^)(BOOL success,NSError *error))CompletionHandler{
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        // 创建一个请求,把一个图片存储到相册
        //1.把图片存到系统相册
        //2.存图片前,现在相册中给他创建一个占位对象,存储完成之后,占位对象引用到真实的图片
        PHAssetChangeRequest *createAssetRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
// 创建一个自定义的相册,并且生成一个相册请求对象
        PHAssetCollection *collection = [self searchCollection:title];
        PHAssetCollectionChangeRequest *albumChangeRequest;
        if (collection) {
            albumChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        }else{
            albumChangeRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title];
        }
        //通过相片请求对象,获得存储的图片的占位对象
        PHObjectPlaceholder *assetPlaceholder = [createAssetRequest placeholderForCreatedAsset];
        //把占位对象作为参数,实现引用存储图片到相册
        [albumChangeRequest addAssets:@[ assetPlaceholder ]];
    } completionHandler:CompletionHandler];
}
+(PHAssetCollection *)searchCollection:(NSString *)title{
    PHFetchResult *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (PHAssetCollection *collection in result) {
        if ([collection.localizedTitle isEqualToString:title]) {
            return collection;
        }
    }
    return nil;
}
@end
