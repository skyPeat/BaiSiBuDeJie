//
//  SPBaseViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/21.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPBaseViewController.h"
#import "SPAllViewController.h"
#import "SPVideoViewController.h"
#import "SPVoiceViewController.h"
#import "SPTextViewController.h"
#import "SPPictureViewController.h"
static NSString * const ID = @"cell";
@interface SPBaseViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,weak) UIScrollView *titleView;
@property(nonatomic,weak) UIButton *selectedButton;
@property(nonatomic,weak) UICollectionView *collectionView;
@property(nonatomic,strong) NSMutableArray *buttonArray;
@property(nonatomic,weak) UIView *lineView;
@end

@implementation SPBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //    1、添加子控制器
    [self addChildViewControllers];
    //    2、设置collectionView
    [self setUpCollectionView];
    //    3、设置标题栏
    [self addTitleView];
}
-(void)randomClick{
    
}
#pragma mark- 添加子控制器
-(void)addChildViewControllers{
   
}
#pragma mark- 设置collectionView
-(void)setUpCollectionView{
    //    0、创建流水布局
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    flowLayOut.itemSize = SP_ScreenSize;
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayOut.minimumLineSpacing = 0;
    flowLayOut.minimumInteritemSpacing = 0;
    //    1、创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:SP_ScreenBounds collectionViewLayout:flowLayOut];
    collectionView.pagingEnabled = YES;
    collectionView.bounces = NO;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.childViewControllers.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    UITableView *tableView = (UITableView *)self.childViewControllers[indexPath.item].view;
    tableView.frame = SP_ScreenBounds;
    tableView.contentInset = UIEdgeInsetsMake(100, 0, 50, 0);
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [cell.contentView addSubview:tableView];
    return cell;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / SP_ScreenW;
    [self titleButtonClick:self.buttonArray[index]];
}
#pragma mark- 设置标题栏
-(NSMutableArray *)buttonArray{
    if (_buttonArray == nil) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}
-(void)addTitleView{
    UIScrollView *titleView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SP_ScreenW, 35)];
    titleView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:titleView];
    NSInteger count = self.childViewControllers.count;
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = SP_ScreenW / count;
    CGFloat buttonH = 35;
    for (int i = 0; i < count; i++) {
        buttonX = buttonW * i;
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag = i;
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [titleButton setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [titleView addSubview:titleButton];
        [self.buttonArray addObject:titleButton];
        //        添加下划线
        if (i == 0) {
            [self titleButtonClick:titleButton];
            UIView *lineView = [[UIView alloc] init];
            [titleButton.titleLabel sizeToFit];
            lineView.SP_width = titleButton.titleLabel.SP_width;
            lineView.SP_height = 1.5;
            lineView.SP_centerX = titleButton.SP_centerX;
            lineView.SP_y = titleView.SP_height - lineView.SP_height;
            lineView.backgroundColor = [UIColor redColor];
            self.lineView = lineView;
            [titleView addSubview:lineView];
        }
    }
    
}
-(void)titleButtonClick:(UIButton *)titleButton{
    self.selectedButton.selected = NO;
    titleButton.selected = !titleButton.selected;
    self.selectedButton = titleButton;
    self.collectionView.contentOffset = CGPointMake(SP_ScreenW * titleButton.tag, 0);
    [UIView animateWithDuration:0.2 animations:^{
        self.lineView.SP_centerX = titleButton.SP_centerX;
    }];
}
@end
