//
//  SP_BottomView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_BottomView.h"
#import "SP_TopicModel.h"
@interface SP_BottomView ()
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *zhuanfaButton;
@property (weak, nonatomic) IBOutlet UIButton *commitButton;
@end
@implementation SP_BottomView

-(void)setTopicModel:(SP_TopicModel *)topicModel{
    [super setTopicModel:topicModel];
    [self setTitleForButton:self.dingButton number:topicModel.ding];
    [self setTitleForButton:self.caiButton number:topicModel.cai];
    [self setTitleForButton:self.zhuanfaButton number:topicModel.repost];
    [self setTitleForButton:self.commitButton number:topicModel.comment];
}
-(void)setTitleForButton:(UIButton *)button number:(NSInteger)number{
    NSString *title = [NSString stringWithFormat:@"%zd",number];
    if (number >= 10000) {
        CGFloat numF = number / 10000.0;
        title = [NSString stringWithFormat:@"%.1f万",numF];
    }
    [button setTitle:title forState:UIControlStateNormal];
}
@end
