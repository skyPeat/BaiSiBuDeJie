//
//  SP_CollectionViewCell.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/5.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_CollectionViewCell.h"
#import "SP_SquareModel.h"
#import <UIImageView+WebCache.h>
@interface SP_CollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation SP_CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    }
-(void)setModel:(SP_SquareModel *)model{
    _model = model;
    NSURL *url = [NSURL URLWithString:model.icon];
    [self.iconImageView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return ;
        UIImage *roundImage = [UIImage imageWithRoundCorner:image];
        self.iconImageView.image = roundImage;
    }];
    self.nameLabel.text = model.name;
}
@end
