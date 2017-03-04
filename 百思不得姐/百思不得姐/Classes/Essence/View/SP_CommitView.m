//
//  SP_CommitView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_CommitView.h"
#import "SP_TopicModel.h"
#import "SP_CommitModel.h"
#import "SP_UserModel.h"
@interface SP_CommitView ()
@property (weak, nonatomic) IBOutlet UILabel *commitLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;

@end
@implementation SP_CommitView
-(void)setTopicModel:(SP_TopicModel *)topicModel{
    [super setTopicModel:topicModel];
    if (topicModel.hotCommit.cmt_type == TopicMidTypeMusic) {
        self.commitLabel.hidden = YES;
        self.nameLabel.hidden = NO;
        self.timeButton.hidden = NO;
        self.nameLabel.text = [NSString stringWithFormat:@"%@:",topicModel.hotCommit.userModel.username];
        NSString *title = [NSString stringWithFormat:@"%@'",topicModel.hotCommit.voicetime];
        [self.timeButton setTitle:title forState:UIControlStateNormal];
    }else{
        self.commitLabel.hidden = NO;
        self.nameLabel.hidden = YES;
        self.timeButton.hidden = YES;
        self.commitLabel.text = [NSString stringWithFormat:@"%@:  %@",topicModel.hotCommit.userModel.username,topicModel.hotCommit.content];
    }
}

@end
