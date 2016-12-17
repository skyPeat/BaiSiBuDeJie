//
//  SPTopView.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/15.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPTopView.h"
#import <UIImageView+WebCache.h>
#import "SPTopicItem.h"
@interface SPTopView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_lable;

@end
@implementation SPTopView

-(void)setItem:(SPTopicItem *)item{
    [super setItem:item];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:item.profile_image]];
    self.nameLabel.text = item.name;
    self.timeLabel.text = item.create_time;
    self.text_lable.text = item.text;
    
}
@end
