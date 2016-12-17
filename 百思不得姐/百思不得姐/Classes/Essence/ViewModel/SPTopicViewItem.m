//
//  SPTopViewItem.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/15.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPTopicViewItem.h"
#import "SPTopicItem.h"
@implementation SPTopicViewItem
-(void)setItem:(SPTopicItem *)item{
    _item = item;
//    计算topicView的高度
        CGFloat space =  10;
        CGFloat topViewX = space;
        CGFloat topViewY = space;
        CGFloat topViewW = SP_ScreenW;
//    头像的高度
        CGFloat iconImageH = 50;
//    获取文字的高度
        NSDictionary *attri = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
        CGSize textSize = CGSizeMake(SP_ScreenW - space * 2, MAXFLOAT);
        CGFloat textH = [item.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size.height;
    
        CGFloat topViewH = iconImageH + textH + space * 3;
    self.cellHeight = topViewH;
        self.topViewFrame = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    
//    计算middleView的高度
    if (item.type != TopicMidTypeText) {
        CGFloat midH = item.width * item.height / textSize.width;
//        判断是否是大图
        if (midH > SP_ScreenH && !item.isGif) {
            item.is_bigPic = YES;
            midH = 300;
        }
       CGFloat midX = space;
        CGFloat midY = topViewH;
        CGFloat midW = SP_ScreenW - space * 2;
                self.middleViewFrame = CGRectMake(midX, midY, midW, midH);
    }
    self.cellHeight = CGRectGetMaxY(self.middleViewFrame) + space;
    
    self.commentViewFrame = CGRectMake(space, self.cellHeight, topViewW, 50);
    self.cellHeight = CGRectGetMaxY(self.commentViewFrame) + space;
    
}
@end
