//
//  SPTableViewCell.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/7.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "SPTableViewCell.h"
#import "Masonry.h"
#import "SPSubscribItem.h"
#import <UIImageView+WebCache.h>
@interface SPTableViewCell ()
@property(nonatomic,weak) UIImageView *iconImageView;
@property(nonatomic,weak) UILabel *titleLabel;
@property(nonatomic,weak) UIImageView *vipImageView;
@property(nonatomic,weak) UILabel *detailLabel;
@property(nonatomic,weak) UIButton *subscribButton;
@end
@implementation SPTableViewCell
#pragma mark- 添加、布局子控件

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat space = 10;
        //        图标
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        [iconImageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(space);
            make.bottom.equalTo(self.contentView).offset(-space);
            make.width.equalTo(70);
        }];
        //        标题
        UILabel *titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel makeConstraints:^(MASConstraintMaker *make) {
//            titleLabel.text.length
            make.top.equalTo(self.iconImageView);
            make.left.equalTo(self.iconImageView.right).offset(space);
            make.height.equalTo(23);
            make.width.equalTo(80);
        }];
        //        Vip
        UIImageView *vipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        [vipImageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.right).offset(space);
            make.centerY.equalTo(self.titleLabel.centerY);
            make.size.equalTo(CGSizeMake(14, 14));
        }];
        
        //        关注数
        UILabel *detailLabel = [[UILabel alloc] init];
        [self.contentView addSubview:detailLabel];
        self.detailLabel = detailLabel;
        [detailLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.bottom.equalTo(self.iconImageView);
            make.height.equalTo(23);
            make.width.equalTo(50);
        }];
        //       关注按钮
        
        UIButton *subscribButton = [UIButton buttonWithType:UIButtonTypeCustom];
        subscribButton.backgroundColor = SP_Color(240, 240, 240);
        [subscribButton setTitle:@"+ 关注" forState:UIControlStateNormal];
        [subscribButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.subscribButton = subscribButton;
        [self.contentView addSubview:subscribButton];
        [subscribButton makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.centerY);
            make.right.equalTo(space).offset(-space);
            make.width.equalTo(60);
        }];
    }
    return self;
}
-(void)setItem:(SPSubscribItem *)item{
    _item = item;
//    设置昵称
    self.titleLabel.text = item.screen_name;
//    设置圆形头像
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:item.header] placeholderImage:[UIImage imageNamed:@"lml"] options:kNilOptions completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.iconImageView.image = [UIImage roundImage:image placeholderImage:[UIImage imageNamed:@"lml"]];
    }];
//    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:item.header] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//        self.iconImageView.image = [UIImage roundImage:image placeholderImage:[UIImage imageNamed:@"lml"]];
//        SP_Log(@"%@",NSStringFromClass([self.iconImageView.image class]));
//    }];
//    设置关注人数
    NSInteger count = item.fans_count.integerValue;
    NSString *countStr = [NSString stringWithFormat:@"%@人关注",item.fans_count];
    if (count >= 10000) {
        countStr = [NSString stringWithFormat:@"%.1f万人关注",count * 0.0001];
    }
    countStr = [countStr stringByReplacingOccurrencesOfString:@".00" withString:@""];
    self.detailLabel.text = countStr;
//    是否是VIP
    if (item.isVIP){
    self.vipImageView.image = [UIImage imageNamed:@"vip"];
    }else{
     self.vipImageView.hidden = YES;
    }
}

@end
