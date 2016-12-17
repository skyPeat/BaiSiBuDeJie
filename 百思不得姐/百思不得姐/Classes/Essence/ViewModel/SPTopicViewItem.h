//
//  SPTopViewItem.h
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/15.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SPTopicItem;
@interface SPTopicViewItem : NSObject
@property(nonatomic,strong) SPTopicItem *item;
//顶部View的frame
@property(nonatomic,assign) CGRect topViewFrame;
//中间View的frame
@property(nonatomic,assign) CGRect middleViewFrame;
///底部view的frame
@property(nonatomic,assign) CGRect bottomViewFrame;
//热评的frame
@property(nonatomic,assign) CGRect commentViewFrame;
//cell的高度
@property(nonatomic,assign) CGFloat cellHeight;
@end
