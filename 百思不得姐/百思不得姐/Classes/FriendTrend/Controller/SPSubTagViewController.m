//
//  SPSubTagViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/19.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPSubTagViewController.h"
#import "SP_SubTagModel.h"
#import "SP_SubTagCell.h"
#import <SVProgressHUD.h>
static NSString *ID = @"cell";
@interface SPSubTagViewController ()
@property(nonatomic,strong) NSArray *modelArray;
@end

@implementation SPSubTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐关注";
//    0、请求数据
    [self loadData];
    [self.tableView registerNib:[UINib nibWithNibName:@"SP_SubTagCell" bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark- 请求数据
-(NSArray *)modelArray{
    if (!_modelArray) {
        _modelArray = [NSArray array];
    }
    return _modelArray;
}
-(void)loadData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager SP_manager];
    NSDictionary *parameter = @{
                                @"a":@"tags_list",
                                @"c":@"subscribe"
                                };
    NSString *urlString = SP_MainUrl;
    [SVProgressHUD showWithStatus:@"正在加载数据......"];
    [manager SP_GET:urlString parameters:parameter progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *dataArray = responseObject[@"rec_tags"];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dataDict in dataArray) {
            SP_SubTagModel *model = [SP_SubTagModel subTagModelWithDict:dataDict];
            [tempArray addObject:model];
        }
        self.modelArray = tempArray;
//        刷新数据
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD dismiss];
    }];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SP_SubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    SP_SubTagModel *model = self.modelArray[indexPath.row];
    cell.model = model;
        return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 71;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [SVProgressHUD dismiss];
}
@end
