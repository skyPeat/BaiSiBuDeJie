//
//  SPHomeViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPMineViewController.h"
#import "SPSettingViewController.h"
#import "SP_SquareModel.h"
#import "SP_CollectionViewCell.h"
#import <SafariServices/SafariServices.h>
#import "SPWebkitViewController.h"
static NSString *ID = @"cell";
@interface SPMineViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,weak) UICollectionView *collectionView;
@end

@implementation SPMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    0、设置导航条的内容
    [self setUpNavigationbar];
//    1、设置collectionView
    [self setUpCollectionView];
//    2、请求数据
    [self loadData];
//    3、处理cell间距
    [self setUpCellSpace];
    
}
#pragma mark- 设置导航条的内容
-(void)setUpNavigationbar{
    //    right
    UIBarButtonItem *nightButton = [UIBarButtonItem itemWithNormalImageName:@"mine-moon-icon" selectedImageName:@"mine-moon-icon-click" target:self action:@selector(nightClick:)];
    UIBarButtonItem *settingButton = [UIBarButtonItem itemWithNormalImageName:@"mine-setting-icon" selectedImageName:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    self.navigationItem.rightBarButtonItems = @[settingButton,nightButton];
}
-(void)hongbaoClick{
    
}
-(void)nightClick:(UIButton *)button{
    button.selected = !button.selected;
}
-(void)settingClick{
    [self.navigationController pushViewController:[[SPSettingViewController alloc] init] animated:YES];
}
#pragma mark- 设置collectionView
-(void)setUpCollectionView{
//    流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    NSInteger cols = 5;
    CGFloat margin = 1;
    CGFloat cellW = (SP_ScreenW - (cols - 1) * margin) / cols;
    CGFloat cellH = 100;
    layout.itemSize = CGSizeMake(cellW, cellH);
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
//    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.backgroundColor = SP_Color(215, 215, 215);
    collectionView.delegate = self;
    collectionView.dataSource = self;
    self.collectionView = collectionView;
    self.tableView.tableFooterView = collectionView;
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SP_CollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
}
#pragma mark- 请求数据
-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
-(void)loadData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager SP_manager];
    NSDictionary *parameter = @{
                        @"a":@"square",
                        @"c":@"topic"
                                };
    NSString *urlString = SP_MainUrl;
    [manager SP_GET:urlString parameters:parameter progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *squareArray = responseObject[@"square_list"];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in squareArray) {
            SP_SquareModel *model = [SP_SquareModel modelWithDict:dict];
            [tempArray addObject:model];
        }
        self.dataArray = tempArray;
        NSInteger num = 5 - self.dataArray.count % 5;
        for (int i = 0; i < num; i++) {
            SP_SquareModel *model = [SP_SquareModel new];
            [self.dataArray addObject:model];
        }
        NSInteger row = self.dataArray.count / 5;
        CGFloat height = (100 + 1) * row;
        self.collectionView.SP_height = height;
        self.tableView.tableFooterView = self.collectionView;
        [self.collectionView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
#pragma mark- 实现数据源代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SP_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.item];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SP_SquareModel *model = self.dataArray[indexPath.item];
    if ([model.url hasPrefix:@"http:"]) {
        SPWebkitViewController *webkitVC = [[SPWebkitViewController alloc] init];
        webkitVC.url = model.url;
        [self.navigationController pushViewController:webkitVC animated:YES];
    }
}
#pragma mark- 处理cell间距
-(void)setUpCellSpace{
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
}
@end
