//
//  SP_TopicViewModel.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/25.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_TopicViewModel.h"
#import "SP_TopicModel.h"
#import "SP_CommitModel.h"
@implementation SP_TopicViewModel
-(void)setTopicModel:(SP_TopicModel *)topicModel{
    _topicModel = topicModel;
    CGFloat margin = 10;
    CGFloat textY = 65;
    CGFloat textW = SP_ScreenW - margin * 2;
    CGFloat textH = [topicModel.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(textW, CGFLOAT_MAX)].height;
    CGFloat topX = 0;
    CGFloat topY = 0;
    CGFloat topW = SP_ScreenW;
    CGFloat topH = textY + textH + margin;
    CGRect topViewFrame = CGRectMake(topX, topY, topW, topH);
    self.topViewFrame = topViewFrame;
    self.cellHeight = CGRectGetMaxY(topViewFrame) + margin;
    
    if (topicModel.type != TopicMidTypeText) {
        CGFloat middleX = margin;
        CGFloat middleY = CGRectGetMaxY(self.topViewFrame) + margin;
        CGFloat middleW = textW;
        CGFloat middleH = middleW / topicModel.width * topicModel.height;
        if (middleH > SP_ScreenH && !topicModel.is_gif) {
            topicModel.isBig = YES;
            middleH = 300;
        }
        CGRect middleViewFrame = CGRectMake(middleX, middleY, middleW, middleH);
        self.middleViewFrame = middleViewFrame;
        self.cellHeight = CGRectGetMaxY(middleViewFrame) + margin;
    }
    
    CGFloat bottomX = margin;
    CGFloat bottomY = CGRectGetMaxY(self.middleViewFrame);
    CGFloat bottomW = textW;
    CGFloat bottomH = 35;
    self.bottomViewFrame = CGRectMake(bottomX, bottomY, bottomW, bottomH);
    
    
    
    if (topicModel.top_cmt.count) {
        CGFloat commitX = margin;
        CGFloat commitY = CGRectGetMaxY(self.bottomViewFrame) + margin;
        CGFloat commitW = textW;
        CGFloat commitH = 25;
        if (topicModel.hotCommit.cmt_type == TopicMidTypeText) {
            CGFloat commitH = [topicModel.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(textW, MAXFLOAT)].height;
        }
        self.commitViewFrame = CGRectMake(commitX, commitY, commitW, commitH);
        self.cellHeight = CGRectGetMaxY(self.commitViewFrame) + margin;
    }else{
        self.commitViewFrame = CGRectZero;
        self.cellHeight = CGRectGetMaxY(self.bottomViewFrame) + margin;
    }
}
@end
