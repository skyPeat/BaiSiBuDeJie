//
//  SP_FooterView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/13.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_FooterView.h"
@interface SP_FooterView ()
@property (weak, nonatomic) IBOutlet UILabel *popLabel;
@property (weak, nonatomic) IBOutlet UIView *loadView;
@end
@implementation SP_FooterView

+(instancetype)viewFromXib{
   return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}
-(void)setIsLoading:(BOOL)isLoading{
    _isLoading = isLoading;
    self.popLabel.hidden = isLoading;
    self.loadView.hidden = !isLoading;
}
@end
