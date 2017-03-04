//
//  SP_BaseView.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/25.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SP_TopicModel;
@interface SP_BaseView : UIView
@property(nonatomic,strong) SP_TopicModel *topicModel;
+(instancetype)viewFromXib;

@end
