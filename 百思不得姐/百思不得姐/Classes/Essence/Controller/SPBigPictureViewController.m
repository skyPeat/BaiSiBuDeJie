//
//  SPBigPictureViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPBigPictureViewController.h"
#import "SP_TopicModel.h"
#import <SDImageCache.h>
#import <UIImageView+WebCache.h>
@interface SPBigPictureViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *imageScroollView;
@property (weak, nonatomic) IBOutlet UIButton *resposeButton;
@property (weak, nonatomic) IBOutlet UIButton *commitButton;
@property(nonatomic,weak) UIImageView *imageView;
@end

@implementation SPBigPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpPicture];
}

-(void)setUpPicture{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = SP_ScreenW;
    CGFloat imageH = self.model.height / self.model.width * SP_ScreenW;
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backButtonClick:)];
    [imageView addGestureRecognizer:tap];
    imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    self.imageView = imageView;
    [self.imageScroollView addSubview:imageView];
    self.imageScroollView.delegate = self;
    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:self.model.image0];
    [imageView sd_setImageWithURL:self.model.image0.SP_UrlString placeholderImage:image];
    if (self.model.isBig || (self.model.is_gif && self.model.height > SP_ScreenH)) {
        self.imageScroollView.contentSize = CGSizeMake(0, imageH);
        self.imageScroollView.minimumZoomScale = 1.0;
        self.imageScroollView.maximumZoomScale = 2.0;
    }else{
        imageView.center = CGPointMake(SP_ScreenW * 0.5, SP_ScreenH * 0.5);
    }
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}
- (IBAction)backButtonClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)saveButtonClick:(UIButton *)sender {
}
- (IBAction)commitButtonClick:(UIButton *)sender {
}
- (IBAction)responseButtonClick:(UIButton *)sender {
}
@end
