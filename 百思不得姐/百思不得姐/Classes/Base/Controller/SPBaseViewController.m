//
//  SPBaseViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/14.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPBaseViewController.h"
#import "SPTitleButton.h"

static NSString *ID = @"cell";
@interface SPBaseViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,weak) UIScrollView *titleScrollView;
@property(nonatomic,weak) UIView *titleView;
@property(nonatomic,weak) UICollectionView *collectionView;
@property(nonatomic,weak) SPTitleButton *previusClickButton;
@property(nonatomic,weak) UIView *titleUnderline;
@property(nonatomic,strong)NSMutableArray *buttonArray;
@property(nonatomic,assign) BOOL isAddTitleButton;
@end

@implementation SPBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    1、初始化子控制器
    [self setUpChildViewControllers];
    //    2、添加内容控制器
    [self setUpContentViewControllers];
    //    3、添加titleView
    [self setUpTitleView];
    }
-(void)setUpChildViewControllers{

}

#pragma mark- 添加内容控制器
-(void)setUpContentViewControllers{
    self.automaticallyAdjustsScrollViewInsets = NO;
    //    创建流水布局
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    //    设置尺寸
    flowLayOut.itemSize = [UIScreen mainScreen].bounds.size;
    flowLayOut.minimumInteritemSpacing = 0;
    flowLayOut.minimumLineSpacing = 0;
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //    创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayOut];
    self.collectionView = collectionView;
    collectionView.pagingEnabled = YES;
    collectionView.bounces = NO;
    //    设置数据源
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    //    注册cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    collectionView.backgroundColor = [UIColor lightGrayColor];
}
//    实现代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.childViewControllers.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    UITableViewController *childVC = self.childViewControllers[indexPath.item];
    UITableView *childView = (UITableView *)childVC.view;
    childView.frame = self.view.bounds;// CGRectMake(0, 0, SP_ScreenW, SP_ScreenH);
    [cell.contentView addSubview:childView];
    return cell;
}
#pragma mark- 添加titleView
-(void)setUpTitleView{
    UIScrollView *titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SP_TopH, SP_ScreenW, 35)];
    self.titleScrollView = titleScrollView;
    titleScrollView.bounces = NO;
    titleScrollView.showsHorizontalScrollIndicator = NO;
    //    标题按钮
    [self setUpTitleButtons];
    //    下划线
    [self setUpTitleUnderLine];
    

    [self.view addSubview:titleScrollView];
    
}

#pragma mark- 设置标题按钮
-(NSMutableArray *)buttonArray{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}
-(void)setUpTitleButtons{
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = self.titleScrollView.SP_width / 5;
    CGFloat buttonH = self.titleScrollView.SP_height;
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonW * self.childViewControllers.count, buttonH)];
    titleView.backgroundColor = SP_Color(242, 242, 242);
    self.titleView = titleView;
    [self.titleScrollView addSubview:titleView];
    self.titleScrollView.contentSize = titleView.bounds.size;
    //    布局标题按钮
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        buttonX = buttonW * i;
        SPTitleButton *titleButton = [[SPTitleButton alloc] init];
        UIViewController *childVC = self.childViewControllers[i];
        [titleButton setTitle:childVC.title forState:UIControlStateNormal];
        titleButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:titleButton];
        
        [self.buttonArray addObject:titleButton];
    }
   }
-(void)buttonClick:(SPTitleButton *)titleButton{
    self.previusClickButton.selected = NO;
    titleButton.selected = YES;
    self.previusClickButton = titleButton;
    self.collectionView.contentOffset = CGPointMake(SP_ScreenW * titleButton.tag, 0);
    [titleButton.titleLabel sizeToFit];
    [UIView animateWithDuration:0.15 animations:^{
        self.titleUnderline.SP_width = titleButton.titleLabel.SP_width + 15;
        self.titleUnderline.SP_centerX = titleButton.SP_centerX;
    }];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = self.collectionView.contentOffset.x / SP_ScreenW;
    SPTitleButton *titleButton = self.buttonArray[index];
    [self buttonClick:titleButton];
}
#pragma mark- 设置下划线
-(void)setUpTitleUnderLine{
    //    取出第一个按钮
    SPTitleButton *firstTitleButton = self.titleView.subviews.firstObject;
    //    创建下划线
    UIView *titleUnderline = [[UIView alloc] init];
    //    设置位置
    CGFloat underlineH = 2;
    CGFloat underlineY = self.titleView.SP_height - underlineH;
    [firstTitleButton.titleLabel sizeToFit];
    CGFloat underlineW = firstTitleButton.titleLabel.SP_width + 15;
    titleUnderline.frame = CGRectMake(0, underlineY, underlineW, underlineH);
    titleUnderline.SP_centerX = firstTitleButton.SP_centerX;
    titleUnderline.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    [self.titleView addSubview:titleUnderline];
    self.titleUnderline = titleUnderline;
    //    默认第一个按钮被选中
    firstTitleButton.selected = YES;
    self.previusClickButton = firstTitleButton;
}

@end