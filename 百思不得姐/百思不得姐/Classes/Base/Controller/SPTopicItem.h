//
//  SPAllItem.h
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/14.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum : NSInteger{
    TopicMidTypeAll = 1,
    TopicMidTypePicture = 10,
    TopicMidTypeText = 29,
    TopicMidTypeVoice = 31,
    TopicMidTypeVideo = 41,
}TopicMidType;
@interface SPTopicItem : NSObject
//头像
@property(nonatomic,strong) NSString *profile_image;
//昵称
@property(nonatomic,strong) NSString *name;
//内容
@property(nonatomic,strong) NSString *text;
//时间
@property(nonatomic,strong) NSString *create_time;
//中间图片
@property(nonatomic,strong) NSString *image0;
@property(nonatomic,strong) NSString *image1;
@property(nonatomic,strong) NSString *image2;
//图片高度
@property(nonatomic,assign) CGFloat height;
//图片宽度
@property(nonatomic,assign) CGFloat width;
//是否动图
@property(nonatomic,assign,getter=isGif) BOOL is_gif;
//内容的类型
@property(nonatomic,assign) NSInteger type;
//是否大图
@property(nonatomic,assign,getter=isBigPicture) BOOL is_bigPic;

@property (nonatomic, strong) NSString *videouri;
@property(nonatomic, assign) NSInteger videotime; /**< 属性 */
@property (nonatomic, strong) NSString *playcount;

@property(nonatomic, assign) NSInteger voicetime;
@property (nonatomic, strong) NSString *voiceuri;
@end
