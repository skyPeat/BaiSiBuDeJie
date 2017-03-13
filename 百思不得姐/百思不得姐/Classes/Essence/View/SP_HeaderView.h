//
//  SP_HeaderView.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/13.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SP_HeaderView : UIView
@property(nonatomic,assign) BOOL isLoading;
@property(nonatomic,assign) BOOL isAppear;
+(instancetype)viewFromXib;
@end
