//
//  SPMiddleVoiceView.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/16.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPMiddleVoiceView.h"
#import "SPTopicItem.h"
#import "UIImageView+WebCache.h"
@interface SPMiddleVoiceView ()
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *playTimeLabel;

@end
@implementation SPMiddleVoiceView
- (IBAction)playButtonClick:(UIButton *)sender{
    
}
-(void)setItem:(SPTopicItem *)item{
    [super setItem:item];
    [self.pictureImageView sd_setImageWithURL:[NSURL URLWithString:item.image0]];
    self.playCountLabel.text = [NSString stringWithFormat:@"%@播放",item.playcount];
    CGFloat min = item.videotime / 60;
    CGFloat sec = item.videotime % 60;
    self.playTimeLabel.text = [NSString stringWithFormat:@"%02.f:%02.f",min,sec];
}

@end
