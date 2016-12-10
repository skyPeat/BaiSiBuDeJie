//
//  SPRecommendViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/6.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPRecommendViewController.h"
#import "SPLeftView.h"
#import "SPSubscribItem.h"
#import "SPTableViewCell.h"
#import <MJExtension/MJExtension.h>
#import <SVProgressHUD/SVProgressHUD.h>
@interface SPRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak) SPLeftView *leftView;
@property(nonatomic,weak) UITableView *rightView;
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,strong)NSURLSessionDataTask *task;
@end

@implementation SPRecommendViewController

static NSString *ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =SP_Color(240, 240, 240);
//    0、设置导航条的内容
    [self setUpNavigationBar];
//    1、添加子控件
    [self addChildViews];
//    设置分割线占据全屏
    self.rightView.separatorInset = UIEdgeInsetsZero;
//    2、设置数据
    [self loadData];
    [self.rightView registerClass:[SPTableViewCell class] forCellReuseIdentifier:ID];
    self.rightView.rowHeight = 80;
}
#pragma mark- 设置界面标题
-(void)setUpNavigationBar{
    self.title = @"推荐关注";
}
#pragma mark- 添加子控件
-(void)addChildViews{
//  添加左侧标题按钮
    CGFloat scrollX = 0;
    CGFloat scrollY = 0;
    CGFloat scrollW = SP_ScreenW * 0.25;
    CGFloat scrollH = SP_ScreenH;
    UIScrollView *leftScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(scrollX, scrollY, scrollW, scrollH)];
    SPLeftView *leftView = [[SPLeftView alloc] initWithFrame:leftScrollView.bounds];
    [leftScrollView addSubview:leftView];
    leftScrollView.contentSize = CGSizeMake(0, leftScrollView.bounds.size.height);
    [self.view addSubview:leftScrollView];
    
//    添加右侧的tableView
    UITableView *rightView = [[UITableView alloc] init];
    
    CGFloat rightX = leftScrollView.bounds.size.width;
    CGFloat rightY = 0;
    CGFloat rightW = SP_ScreenW - rightX;
    CGFloat rightH = SP_ScreenH;
    rightView.frame = CGRectMake(rightX, rightY, rightW, rightH);
    self.rightView = rightView;
    rightView.dataSource = self;
    rightView.delegate = self;
    [self.view addSubview:rightView];
    rightView.contentInset = UIEdgeInsetsMake(SP_TopH, 0, 0, 0);
//    添加下拉刷新控件
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = randomColor;
    headerLabel.text = @"松开立即更新";
    headerLabel.backgroundColor = [UIColor redColor];
    headerLabel.frame = CGRectMake(0, -44, rightW, 44);
    [rightView addSubview:headerLabel];
}
#pragma mark- 加载数据
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
-(void)loadData{
//    0、创建会话管理者
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
//    1、拼接请求参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    parameter[@"a"] = @"friend_recommend";
    parameter[@"c"] = @"user";
//    提示用户正在加载数据
    [SVProgressHUD showWithStatus:@"正在玩命的加载数据......"];
//    2、发送请求
    self.task = [manger SP_GET:@"http://api.budejie.com/api/api_open.php" parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
//        移除指示器
        [SVProgressHUD dismiss];
//    3、字典转模型
        NSArray *array = responseObject[@"top_list"];
//    4、字典数组转化模型数组
        self.dataArray = [SPSubscribItem mj_objectArrayWithKeyValuesArray:array];
//    5、刷行数据
        [self.rightView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //        移除指示器
        [SVProgressHUD dismiss];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SPTableViewCell *cell = [self.rightView dequeueReusableCellWithIdentifier:ID];
   //    设置数据
    SPSubscribItem *item = self.dataArray[indexPath.row];
    cell.item = item;
    return cell;
}
-(void)viewWillDisappear:(BOOL)animated{
//    移除指示器
    [SVProgressHUD dismiss];
//    取消请求
    [self.task cancel];
}
@end
