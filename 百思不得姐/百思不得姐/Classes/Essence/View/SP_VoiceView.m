//
//  SP_VoiceView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_VoiceView.h"
#import "SP_TopicModel.h"
#import <UIImageView+WebCache.h>
@interface SP_VoiceView ()
@property (weak, nonatomic) IBOutlet UIImageView *voiceImageView;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *playTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *palyButton;

@end
@implementation SP_VoiceView

-(void)setTopicModel:(SP_TopicModel *)topicModel{
    [super setTopicModel:topicModel];
    [self.voiceImageView sd_setImageWithURL:topicModel.image0.SP_UrlString];
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放",topicModel.playcount];
    CGFloat min = topicModel.voicetime / 60;
    CGFloat sec = topicModel.voicetime % 60;
    self.playTimeLabel.text = [NSString stringWithFormat:@"%02.f:%02.f",min,sec];
}
@end
