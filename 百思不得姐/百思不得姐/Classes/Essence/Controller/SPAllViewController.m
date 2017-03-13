//
//  SPAllViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/13.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPAllViewController.h"
#import "SP_TopicCell.h"
#import "SP_TopicModel.h"
#import "SP_TopicViewModel.h"
#import "SP_FooterView.h"
#import "SP_HeaderView.h"
static NSString *const ID = @"cell";
@interface SPAllViewController ()
@property(nonatomic,strong) NSMutableArray *topicArray;
@property(nonatomic,weak) SP_FooterView *footerView;
@property(nonatomic,weak) SP_HeaderView *headerView;
@property(nonatomic,strong) NSString *maxTime;
@property(nonatomic,assign) UIEdgeInsets inset;
@end

@implementation SPAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    请求数据
    [self loadData];
    [self.tableView registerClass:[SP_TopicCell class] forCellReuseIdentifier:ID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIEdgeInsets inset = UIEdgeInsetsMake(99, 0, 49, 0);;
     self.tableView.scrollIndicatorInsets =inset;
    self.inset = inset;
    // 上拉加载更多数据
    [self setUpFooterRefreshView];
    //下拉刷新数据
    [self setUpHeaderRefreshView];

}
#pragma mark- 上拉加载更多数据
-(void)setUpFooterRefreshView{
    SP_FooterView *footerView = [SP_FooterView viewFromXib];
    self.footerView = footerView;
    self.tableView.tableFooterView = footerView;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self dealFooterView];
    [self dealHeaderView];
}
-(void)dealFooterView{
    if (self.topicArray.count == 0) return;
    if (self.tableView.contentOffset.y >= self.tableView.contentSize.height + self.tableView.contentInset.bottom - self.tableView.SP_height ) {
        if (!_footerView.isLoading) {
            self.footerView.isLoading = YES;
            [self loadMoreData];
        }
    }
}
-(void)dealHeaderView{
    if (self.tableView.contentOffset.y <= -(self.tableView.contentInset.top + 35)) {
        self.headerView.isAppear = YES;
    }else{
        self.headerView.isAppear = NO;
    }
}
-(void)loadMoreData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager SP_manager];
    NSDictionary *parameter = @{
                                @"a":@"list",
                                @"c":@"data",
                                @"type":@"10",
                                @"maxtime":_maxTime
                                //                                @"type":@"41"
                                };
    NSString *urlString = SP_MainUrl;
    [manager SP_GET:urlString parameters:parameter progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.footerView.isLoading = NO;
        self.maxTime = responseObject[@"info"][@"maxtime"];
        NSArray *listArray = responseObject[@"list"];
        for (NSDictionary *listDict in listArray) {
            SP_TopicModel *topicModel = [SP_TopicModel topicModelWithDict:listDict];
            SP_TopicViewModel *viewModel = [[SP_TopicViewModel alloc] init];
            viewModel.topicModel = topicModel;
            [self.topicArray addObject:viewModel];
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        self.footerView.isLoading = NO;
    }];
}
#pragma mark- 下拉刷新数据
-(void)setUpHeaderRefreshView{
    SP_HeaderView *headerView = [SP_HeaderView viewFromXib];
    self.headerView = headerView;
     headerView.SP_y = -headerView.SP_height;
    [self.tableView addSubview:headerView];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (self.headerView.isAppear && !self.headerView.isLoading) {
        self.headerView.isLoading = YES;
        [self loadData];
        self.tableView.contentInset = UIEdgeInsetsMake(self.inset.top + self.headerView.SP_height, 0, self.inset.bottom, 0);
    }
}
#pragma mark- 请求数据
-(NSMutableArray *)topicArray{
    if (_topicArray == nil) {
        _topicArray = [NSMutableArray array];
    }
    return _topicArray;
}
-(void)loadData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager SP_manager];
    NSDictionary *parameter = @{
                                @"a":@"list",
                                @"c":@"data",
                                @"type":@"10"
//                                @"type":@"41"
                                };
    NSString *urlString = SP_MainUrl;
    [manager SP_GET:urlString parameters:parameter progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.tableView.contentInset = self.inset;
        self.headerView.isLoading = NO;
        self.maxTime = responseObject[@"info"][@"maxtime"];
        NSArray *listArray = responseObject[@"list"];
        [self.topicArray removeAllObjects];
        for (NSDictionary *listDict in listArray) {
            SP_TopicModel *topicModel = [SP_TopicModel topicModelWithDict:listDict];
            SP_TopicViewModel *viewModel = [[SP_TopicViewModel alloc] init];
            viewModel.topicModel = topicModel;
            [self.topicArray addObject:viewModel];
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        self.tableView.contentInset = self.inset;
        self.headerView.isLoading = NO;
    }];
}
#pragma mark- 实现代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.footerView.hidden = self.topicArray.count == 0;
    return self.topicArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SP_TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.topicViewModel = self.topicArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.topicArray[indexPath.row] cellHeight];
}
@end
