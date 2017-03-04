//
//  SP_TopicCell.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_TopicCell.h"
#import "SP_TopicViewModel.h"
#import "SP_TopView.h"
#import "SP_PictureView.h"
#import "SP_VideoView.h"
#import "SP_TopicModel.h"
#import "SP_VoiceView.h"
#import "SP_BottomView.h"
#import "SP_CommitView.h"
@interface SP_TopicCell ()

@property(nonatomic,weak) SP_TopView *topView;
@property(nonatomic,weak) SP_PictureView *pictureView;
@property(nonatomic,weak) SP_VideoView *videoView;
@property(nonatomic,weak) SP_VoiceView *voiceView;
@property(nonatomic,weak) SP_BottomView *bottomView;
@property(nonatomic,weak) SP_CommitView *commitView;

@end
@implementation SP_TopicCell

-(void)setTopicViewModel:(SP_TopicViewModel *)topicViewModel{
    _topicViewModel = topicViewModel;
    self.topView.topicModel = topicViewModel.topicModel;
    self.topView.frame = topicViewModel.topViewFrame;
    
    self.pictureView.topicModel = topicViewModel.topicModel;
    self.pictureView.frame = topicViewModel.middleViewFrame;
    
    self.videoView.topicModel = topicViewModel.topicModel;
    self.videoView.frame = topicViewModel.middleViewFrame;
    
    self.voiceView.topicModel = topicViewModel.topicModel;
    self.voiceView.frame = topicViewModel.middleViewFrame;
    
    self.bottomView.topicModel = topicViewModel.topicModel;
    self.bottomView.frame = topicViewModel.bottomViewFrame;
    
    self.commitView.topicModel = topicViewModel.topicModel;
    self.commitView.frame = topicViewModel.commitViewFrame;
    
   SP_TopicModel *model = topicViewModel.topicModel;
    if (model.type == TopicMidTypeVideo) {
        self.pictureView.hidden = YES;
        self.videoView.hidden = NO;
        self.voiceView.hidden = YES;
    }else if (model.type == TopicMidTypePicture){
        self.pictureView.hidden = NO;
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
    }else if (model.type == TopicMidTypeMusic){
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;
        self.voiceView.hidden = NO;
    }else{
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
    }
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        0、添加顶部topView
        SP_TopView *topView = [SP_TopView viewFromXib];
        self.topView = topView;
        [self.contentView addSubview:topView];
//        1、添加中间的middleView
//        picture
        SP_PictureView *pictureView = [SP_PictureView viewFromXib];
        self.pictureView = pictureView;
        [self.contentView addSubview:pictureView];
//        video
        SP_VideoView *videoView = [SP_VideoView viewFromXib];
        self.videoView = videoView;
        [self.contentView addSubview:videoView];
//        voice
        SP_VoiceView *voiceView = [SP_VoiceView viewFromXib];
        self.voiceView = voiceView;
        [self.contentView addSubview:voiceView];
        //        2、添加底部的bottomView
        SP_BottomView *bottomView = [SP_BottomView viewFromXib];
        self.bottomView = bottomView;
        [self.contentView addSubview:bottomView];
//        3、添加评论的commitView
        SP_CommitView *commitView = [SP_CommitView viewFromXib];
        self.commitView = commitView;
        [self.contentView addSubview:commitView];
    }
    return self;
}
-(void)setFrame:(CGRect)frame{
    frame.size.height -= 10;
    [super setFrame:frame];
}
@end
