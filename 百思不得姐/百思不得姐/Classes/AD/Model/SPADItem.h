//
//  SPADItem.h
//  百思不得姐
//
//  Created by 潘天峰 on 2016/12/4.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPADItem : NSObject
// 广告图片地址
@property(nonatomic,strong) NSString *w_picurl;
//广告界面地址
@property(nonatomic,strong) NSString *ori_curl;
//广告图片的大小
@property(nonatomic,assign) CGFloat w;
@property(nonatomic,assign) CGFloat h;
@end
