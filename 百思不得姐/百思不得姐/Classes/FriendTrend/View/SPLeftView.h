//
//  SPLeftView.h
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/6.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SPLeftView;
@protocol SPLeftViewDelegete <NSObject>

-(SPLeftView *)leftView:(SPLeftView *)leftView;

@end


@interface SPLeftView : UIView
@property(nonatomic,weak) id<SPLeftViewDelegete> deleget;
@end
