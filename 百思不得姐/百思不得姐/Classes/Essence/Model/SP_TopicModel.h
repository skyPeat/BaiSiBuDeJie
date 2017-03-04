//
//  SP_TopicModel.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//
typedef enum : NSUInteger {
    TopicMidTypePicture = 10,
    TopicMidTypeVideo = 41,
    TopicMidTypeMusic = 31,
    TopicMidTypeText = 29,
    TopicMidTypeAll = 1,
} TopicMidType;

#import <Foundation/Foundation.h>
@class SP_CommitModel;
@interface SP_TopicModel : NSObject
@property(nonatomic,strong) NSString *profile_image;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *create_time;
@property(nonatomic,strong) NSString *text;

@property (nonatomic, strong) NSString *image0;
@property (nonatomic, strong) NSString *image1;
@property (nonatomic, strong) NSString *image2;
@property(nonatomic,assign) CGFloat height;
@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) BOOL is_gif;
@property(nonatomic,assign) NSInteger type;
@property(nonatomic,assign) BOOL isBig;

@property (nonatomic, strong) NSString *videouri;
@property(nonatomic, assign) NSInteger videotime; /**< 属性 */
@property (nonatomic, assign) NSInteger playcount;

@property(nonatomic, assign) NSInteger voicetime;
@property (nonatomic, strong) NSString *voiceuri;

@property(nonatomic,strong) NSArray *top_cmt;
@property(nonatomic,strong) SP_CommitModel *hotCommit;

@property(nonatomic, assign) NSInteger ding;
@property(nonatomic, assign) NSInteger cai;

@property(nonatomic, assign) NSInteger comment;

@property(nonatomic, assign) NSInteger repost;

+(instancetype)topicModelWithDict:(NSDictionary *)dict;
@end
