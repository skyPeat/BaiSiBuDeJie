//
//  SPCollectionViewCell.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/11.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPCollectionViewCell.h"
#import "SPSquareItem.h"
#import <UIImageView+WebCache.h>
@interface SPCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation SPCollectionViewCell
-(void)setItem:(SPSquareItem *)item{
    _item = item;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:item.icon]];
    self.nameLabel.text = item.name;
}
@end
