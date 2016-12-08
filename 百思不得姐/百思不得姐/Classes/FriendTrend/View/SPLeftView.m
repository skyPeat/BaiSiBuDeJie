//
//  SPLeftView.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/6.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPLeftView.h"
#import "SPLeftButton.h"
@interface SPLeftView ()
@property(nonatomic,weak) UIButton *leftClickButton;
@property(nonatomic,weak) SPLeftButton *previusClickButton;
@property(nonatomic,weak) UIView *redSliderLine;
@end
@implementation SPLeftView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor =SP_Color(240, 240, 240);
//        添加button
        [self addTitleButton];
//        添加右侧滑动的线
        [self addRedLine];
    }
    return self;
}
/**
 *  添加左侧按钮
 */
-(void)addTitleButton{
    NSArray *titleArray = @[@"推荐",@"网红",@"精品",@"搞笑",@"创意",@"视频",@"图文",@"潜力",@"生活",@"原创"];
    NSInteger count = titleArray.count;
    CGFloat titleX = 1;
    CGFloat titleY = 0;
    CGFloat titleW = self.SP_width - titleX;
    CGFloat titleH = self.SP_height / count;
    for (NSInteger i = 0; i < count; i++) {
        SPLeftButton *titleButton = [[SPLeftButton alloc] init];
        [titleButton setTitle:titleArray[i] forState:UIControlStateNormal];
        titleButton.frame = CGRectMake(titleX, titleY + (titleH * i), titleW, titleH);
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:titleButton];
    }
    }
-(void)titleButtonClick:(SPLeftButton *)titleButton{
    

    self.previusClickButton.selected = NO;
    self.previusClickButton.backgroundColor = self.backgroundColor;
    
    titleButton.selected = YES;
    if (titleButton.selected) {
        
        titleButton.backgroundColor = [UIColor whiteColor];
    }
        self.previusClickButton = titleButton;
    [UIView animateWithDuration:0.1 animations:^{
        self.redSliderLine.SP_y = titleButton.SP_y;
    }];
    
    }
-(void)addRedLine{
//    取出第一个按钮
    SPLeftButton *firstButton = self.subviews.firstObject;
//    创建左侧滑动线条
    UIView *redLineView = [[UIView alloc] init];
    CGFloat lineX = 0;
    CGFloat lineW = 2;
    CGFloat lineH = firstButton.bounds.size.height;
    CGFloat lineY = 0;
    redLineView.frame = CGRectMake(lineX, lineY, lineW, lineH);
    redLineView.backgroundColor = [firstButton titleColorForState:UIControlStateSelected];
    self.redSliderLine = redLineView;
    [self addSubview:redLineView];
    [self titleButtonClick:firstButton];
}
@end
