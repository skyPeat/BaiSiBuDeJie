//
//  SP_TopView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_TopView.h"
#import "SP_TopicModel.h"
#import <UIImageView+WebCache.h>
@interface SP_TopView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_Label;
@end
@implementation SP_TopView

-(void)setTopicModel:(SP_TopicModel *)topicModel{
    [super setTopicModel:topicModel];
    NSURL *url = [NSURL URLWithString:topicModel.profile_image];
    [self.iconImageView sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       if (image == nil) return;
        UIImage *newImage = [UIImage imageWithRoundCorner:image];
        self.iconImageView.image = newImage;
    }];
    
    self.nameLabel.text = topicModel.name;
    
    self.timeLabel.text = [self dealTime];;
    
    self.text_Label.text = topicModel.text;
}
-(NSString *)dealTime{
    NSString *creatTime = self.topicModel.create_time;
//    日期格式化
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *creatDate = [formatter dateFromString:creatTime];
    if ([creatDate isThisYear]) {
        if ([creatDate isToday]) {
            NSDateComponents *com = [creatDate dealTime];
            if (!com.hour) {
                if (com.minute < 1) {
                    creatTime = @"刚刚";
                }else{
                    creatTime = [NSString stringWithFormat:@"%ld分钟前",com.minute];
                }
            }else{
                creatTime = [NSString stringWithFormat:@"%ld小时前",com.hour];
            }
            
        }else if ([creatDate isYesterday]){
            formatter.dateFormat = @"昨天 HH:mm:ss";
            creatTime = [formatter stringFromDate:creatDate];
        }else{
            formatter.dateFormat = @"MM-dd HH:mm:ss";
            creatTime = [formatter stringFromDate:creatDate];
        }
    }
    return creatTime;
}
- (IBAction)moreButtonClick:(UIButton *)sender {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"转发" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:action1];
    [alertVC addAction:action2];
    [alertVC addAction:action3];
    [self.window.rootViewController presentViewController:alertVC animated:YES completion:nil];
}
@end
