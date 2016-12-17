//
//  SPBaseView.h
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/15.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SPTopicItem;
@interface SPBaseView : UIView
@property(nonatomic,strong) SPTopicItem *item;
+(instancetype)viewFromXib;
@end
