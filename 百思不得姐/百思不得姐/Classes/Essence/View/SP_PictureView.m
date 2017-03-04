//
//  SP_PictureView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/25.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_PictureView.h"
#import <UIImageView+WebCache.h>
#import <SDImageCache.h>
#import "SP_TopicModel.h"
#import <DALabeledCircularProgressView.h>
@interface SP_PictureView ()
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigImageButton;
@end
@implementation SP_PictureView
-(void)awakeFromNib{
    [super awakeFromNib];
    //    self.progressView.trackTintColor = [UIColor lightGrayColor];
    self.progressView.backgroundColor = [UIColor lightGrayColor];
    self.progressView.roundedCorners = YES;
}
-(void)setTopicModel:(SP_TopicModel *)topicModel{
    [super setTopicModel:topicModel];
    
    self.gifImageView.hidden = !topicModel.is_gif;
    self.seeBigImageButton.hidden = !topicModel.isBig ;
    
    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:topicModel.image0];
    if (image && (image.size.width <= SP_ScreenW-20)) {
        [self.pictureImageView sd_setImageWithURL:topicModel.image0.SP_UrlString];
    }else{
    [self.pictureImageView sd_setImageWithURL:topicModel.image0.SP_UrlString placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (receivedSize <= 0) return;
        CGFloat progress = 1.0 * receivedSize / expectedSize;
        self.progressView.progress = progress;
        self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.02lf%%",progress*100];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!topicModel.isBig) return;
        if (!image) return;
        CGFloat imageW = SP_ScreenH - 20;
        CGFloat imageH = imageW / topicModel.width * topicModel.height;
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0);
        [image drawInRect:CGRectMake(0, 0, imageW, imageH)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.pictureImageView.image = newImage;
        [[SDImageCache sharedImageCache] storeImage:newImage forKey:topicModel.image0];
    }];
    }
    if (topicModel.isBig) {
        self.pictureImageView.contentMode = UIViewContentModeTop;
        self.pictureImageView.clipsToBounds = YES;
    }else{
        self.pictureImageView.contentMode = UIViewContentModeScaleAspectFit;
        
    }
}
@end
