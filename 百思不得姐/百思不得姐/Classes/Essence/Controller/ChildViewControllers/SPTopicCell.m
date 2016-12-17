//
//  SPTopicCell.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/15.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPTopicCell.h"
#import "SPTopView.h"
#import "SPTopicItem.h"
#import "SPTopicViewItem.h"
#import "SPMiddlePictureView.h"
#import "SPMiddleVideoView.h"
#import "SPMiddleVoiceView.h"
#import "SPCommentView.h"
@interface SPTopicCell ()
@property(nonatomic,weak) SPTopView *topView;
@property(nonatomic,weak) SPMiddlePictureView *middlePictureView;
@property(nonatomic,weak) SPMiddleVideoView *middleVideoView;
@property(nonatomic,weak) SPMiddleVoiceView *middleVoiceView;
@property(nonatomic,weak) SPCommentView *commentView;
@end
@implementation SPTopicCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        0、添加顶部的View
        SPTopView *topView = [SPTopView viewFromXib];
        self.topView = topView;
        [self.contentView addSubview:topView];
//        1.1 添加中间的pictureView
        SPMiddlePictureView *middlePictureView = [SPMiddlePictureView viewFromXib];
        self.middlePictureView = middlePictureView;
        [self.contentView addSubview:middlePictureView];
//        1.2 添加中间的videoView
        SPMiddleVideoView *middleVideoView = [SPMiddleVideoView viewFromXib];
        self.middleVideoView = middleVideoView;
        [self.contentView addSubview:middleVideoView];
//        1.3 添加中间的voiceView
        SPMiddleVoiceView *middleVoiceView = [SPMiddleVoiceView viewFromXib];
        self.middleVoiceView = middleVoiceView;
        [self.contentView addSubview:middleVoiceView];
//        1.4 添加热评
        SPCommentView *commentView = [SPCommentView viewFromXib];
        self.commentView = commentView;
        [self.contentView addSubview:commentView];
//        2、添加底部的view
    }
    return self;
}

-(void)setItem:(SPTopicViewItem *)item{
    _item = item;
//    顶部视图
    self.topView.item = item.item;
    self.topView.frame = item.topViewFrame;
//    中部图片
    self.middlePictureView.item = item.item;
    self.middlePictureView.frame = item.middleViewFrame;
//    中部视频
    self.middleVideoView.item = item.item;
    self.middleVideoView.frame = item.middleViewFrame;
    //    中部音频
    self.middleVoiceView.item = item.item;
    self.middleVoiceView.frame = item.middleViewFrame;
//    热评
    self.commentView.item = item.item;
    self.commentView.frame = item.commentViewFrame;
    SPTopicItem *topicItem = item.item;
    if (topicItem.type == TopicMidTypePicture ) {
        self.middlePictureView.hidden = NO;
        self.middleVideoView.hidden = YES;
        self.middleVoiceView.hidden = YES;
    }else if (topicItem.type == TopicMidTypeVideo){
        self.middleVideoView.hidden = NO;
        self.middlePictureView.hidden = YES;
        self.middleVoiceView.hidden = YES;
    }else if (topicItem.type == TopicMidTypeVoice){
        self.middleVideoView.hidden = YES;
        self.middlePictureView.hidden = YES;
        self.middleVoiceView.hidden = NO;
    }
    
}

@end
