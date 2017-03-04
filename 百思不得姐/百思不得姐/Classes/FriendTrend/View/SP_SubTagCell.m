//
//  SP_SubTagCell.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/19.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_SubTagCell.h"
#import <UIImageView+WebCache.h>
#import "SP_SubTagModel.h"
@interface SP_SubTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end
@implementation SP_SubTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}
-(void)setModel:(SP_SubTagModel *)model{
    _model = model;
//    iconImageView
    NSURL *urlStr = [NSURL URLWithString:model.image_list];
    [self.iconImageView sd_setImageWithURL:urlStr completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return ;
        UIImage *roundImage = [UIImage imageWithRoundCorner:image];
        self.iconImageView.image = roundImage;
    }];
//    nameLabel
    self.nameLabel.text = model.theme_name;
//    countLabel
    NSString *numStr = [NSString stringWithFormat:@"%@人订阅",model.sub_number];
    NSInteger num = numStr.integerValue;
    if (num >= 10000) {
        CGFloat num1 = num / 10000.0;
        numStr = [NSString stringWithFormat:@"%.1f万人订阅",num1];
    }
    numStr = [numStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    self.countLabel.text = numStr;
}
-(void)setFrame:(CGRect)frame{
    frame.size.height -= 1;
    [super setFrame:frame];
}
@end
