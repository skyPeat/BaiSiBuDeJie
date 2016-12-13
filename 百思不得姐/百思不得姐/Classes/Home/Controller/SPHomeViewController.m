//
//  SPHomeViewController.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/21.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPHomeViewController.h"
#import "SPSettingViewController.h"
#import "SPSquareItem.h"
#import "SPCollectionViewCell.h"
#import <MJExtension.h>
#import <SafariServices/SafariServices.h>
static NSString *ID = @"cell";
static NSInteger rank = 4;
#define margin  1
#define itemWH (SP_ScreenW - (rank - 1) * margin) / rank
@interface SPHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSMutableArray *squareArray;
@property(nonatomic,weak) UICollectionView *collectionView;
@end

@implementation SPHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    0、设置导航条的内容
    [self setUpNavigationBar];
//    1、设置footerView
    [self setUpFooterView];
//    2、加载数据
    [self loadData];
//    3、处理cell的间距
    [self setUpCellSpace];
}
#pragma mark-
#pragma mark- 设置导航条的内容
-(void)setUpNavigationBar{
    UIBarButtonItem *nightItem = [UIBarButtonItem itemWithNormalImage:[UIImage imageNamed:@"mine-moon-icon"] selectedImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(moonIconClick:)];
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithNormalImage:[UIImage imageNamed:@"mine-setting-icon"] highlightedImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(settingClick)];
    self.navigationItem.rightBarButtonItems = @[settingItem,nightItem];
    self.navigationItem.title = @"我的";
}
#pragma mark- 设置黑夜场景
-(void)moonIconClick:(UIButton *)moonButton{
    moonButton.selected = !moonButton.selected;
}
#pragma mark- 跳转设置界面
-(void)settingClick{
    SPSettingViewController *settingVC = [[SPSettingViewController alloc] init];
//    跳转之前隐藏底部条
    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}
#pragma mark- 设置footerView
-(void)setUpFooterView{
//    流水布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    设置cell的尺寸
    flowLayout.itemSize = CGSizeMake(itemWH, itemWH);
    flowLayout.minimumLineSpacing = margin;
    flowLayout.minimumInteritemSpacing = margin;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = SP_Color(215, 215, 215);
    self.collectionView = collectionView;
    self.tableView.tableFooterView = collectionView;
//    设置数据源
    collectionView.dataSource = self;
    collectionView.delegate = self;
    //    注册一个collectionViewCell
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SPCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    
}
#pragma mark-  实现数据源和代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.squareArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    SPSquareItem *item = self.squareArray[indexPath.row];
    cell.item = item;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    取出模型
    SPSquareItem *item = self.squareArray[indexPath.row];
//    判断url是否包含http
    if ([item.url hasPrefix:@"http"]) {

//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:item.url]];//该方法会自动跳转到safri,离开当前应用
        //2.UIWebView ,功能单一.只是打开一般的网页.没有地址栏,没有进度条
        SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:item.url]];
        [self presentViewController:safariVC animated:YES completion:nil];
    }else{
        
    }
}
#pragma mark- 加载数据
-(void)loadData{
//    创建会话管理
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    拼接请求参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    parameter[@"a"] = @"square";
    parameter[@"c"] = @"topic";
//    发送请求
    [manager SP_GET:@"http://api.budejie.com/api/api_open.php" parameters:parameter success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
//    解析数据
        NSArray *array = responseObject[@"square_list"];
//    数组字典转模型字典
        self.squareArray = [SPSquareItem mj_objectArrayWithKeyValuesArray:array];
//    处理数据
        [self resoveData];
//    刷新数据
        [self.collectionView reloadData];
//    设置collectionView的高度
        NSInteger count = self.squareArray.count;
        NSInteger row = (count - 1) / rank + 1;
        CGFloat collectionViewH = row * (itemWH + margin);
        self.collectionView.SP_height = collectionViewH;
        self.tableView.tableFooterView = self.collectionView;
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
#pragma mark- 处理空格位置
-(void)resoveData{
    NSInteger count = self.squareArray.count;
    NSInteger entr = count % rank;
    if (entr) {
        for (int i = 0; i < entr; i++) {
            SPSquareItem *item = [[SPSquareItem alloc] init];
            [self.squareArray addObject:item];
        }
    }
}
#pragma mark- 处理cell间距
-(void)setUpCellSpace{
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
}
@end
