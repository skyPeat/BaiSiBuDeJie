//
//  SP_TopicViewModel.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/25.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SP_TopicModel;
@interface SP_TopicViewModel : NSObject
@property(nonatomic,strong) SP_TopicModel *topicModel;
@property(nonatomic,assign) CGRect topViewFrame;
@property(nonatomic,assign) CGRect middleViewFrame;
@property(nonatomic,assign) CGFloat cellHeight;
@property(nonatomic,assign) CGRect bottomViewFrame;
@property(nonatomic,assign) CGRect commitViewFrame;
@end
