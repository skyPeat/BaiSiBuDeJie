//
//  SP_VidoView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_VideoView.h"
#import <UIImageView+WebCache.h>
#import "SP_TopicModel.h"
@interface SP_VideoView ()
@property (weak, nonatomic) IBOutlet UIImageView *image_View;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *playTimeLabel;

@end
@implementation SP_VideoView

-(void)setTopicModel:(SP_TopicModel *)topicModel{
    [super setTopicModel:topicModel];
    [self.image_View sd_setImageWithURL:topicModel.image0.SP_UrlString];
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放",topicModel.playcount];
    CGFloat min = topicModel.videotime / 60;
    CGFloat sec = topicModel.videotime % 60;
    self.playTimeLabel.text = [NSString stringWithFormat:@"%02.f:%02.f",min,sec];
}




@end
