//
//  SP_HeaderView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/13.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_HeaderView.h"
@interface SP_HeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *popLabel;
@property (weak, nonatomic) IBOutlet UIView *loadView;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;

@end
@implementation SP_HeaderView

+(instancetype)viewFromXib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}
-(void)awakeFromNib{

    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}
-(void)setIsAppear:(BOOL)isAppear{
    _isAppear = isAppear;
    [UIView animateWithDuration:0.3 animations:^{
        self.arrowImageView.transform = isAppear? CGAffineTransformMakeRotation(-M_PI + 0.001):CGAffineTransformIdentity;
    }];
    self.popLabel.text = isAppear?@"松开立即刷新数据":@"下拉刷新数据";
}
-(void)setIsLoading:(BOOL)isLoading{
    _isLoading = isLoading;
    self.loadView.hidden = !isLoading;
    self.popLabel.hidden = isLoading;
    self.arrowImageView.hidden = isLoading;
}
@end
