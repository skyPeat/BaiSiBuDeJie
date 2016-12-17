//
//  SPMiddleView.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/15.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPMiddlePictureView.h"
#import "SPTopicItem.h"
#import <UIImageView+WebCache.h>
#import "DALabeledCircularProgressView.h"
@interface SPMiddlePictureView ()
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;

@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;

@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigPictureImageView;
@end
@implementation SPMiddlePictureView
-(void)setItem:(SPTopicItem *)item{
    [super setItem:item];
    CGFloat space = 10;
//    从沙盒磁盘中取图
    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:item.image0];
    if (image && image.size.width <= SP_ScreenW - space * 2) {
        [self.pictureView sd_setImageWithURL:[NSURL URLWithString:item.image0]];
    }else{
//    从缓存中取图

//    设置图片
    [self.pictureView sd_setImageWithURL:[NSURL URLWithString:item.image0] placeholderImage:nil options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (receivedSize <= 0) return ;
        CGFloat progress = 1.0 *receivedSize / expectedSize;
        self.progressView.progress = progress;
        self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.2lf%%",progress*100];
        
    }completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!item.isBigPicture) return ;
        if (!image) return;
        
        CGFloat imageW = SP_ScreenW - space * 2;
        CGFloat imageH = imageW * item.height / item.width;
        
//        开启上下文
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0);
//        绘图
        [image drawInRect:CGRectMake(0, 0, imageW, imageH)];
//        获取图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//        关闭上下文
        UIGraphicsEndImageContext();
//        重新设置图片
        self.pictureView.image = newImage;
//        存入缓存
        [[SDImageCache sharedImageCache] storeImage:newImage forKey:item.image0];
    }];
    }
    //    判断是否是动图，不是就隐藏
    self.gifImageView.hidden = !item.isGif;
    //    判读是否是大图，不是就隐藏按钮
    self.seeBigPictureImageView.hidden = !item.isBigPicture;
//    设置大图时的模式
    if (item.is_bigPic) {
        self.pictureView.contentMode = UIViewContentModeTop;
        self.pictureView.clipsToBounds = YES;
    }else{
        self.pictureView.contentMode = UIViewContentModeScaleAspectFit;
        self.pictureView.clipsToBounds = NO;
    }
}
- (IBAction)bigPictureClick:(UIButton *)sender {
    sender.hidden = YES;
    
}

@end
