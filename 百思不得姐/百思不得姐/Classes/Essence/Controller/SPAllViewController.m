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
static NSString *const ID = @"cell";
@interface SPAllViewController ()
@property(nonatomic,strong) NSMutableArray *topicArray;
@end

@implementation SPAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    请求数据
    [self loadData];
    [self.tableView registerClass:[SP_TopicCell class] forCellReuseIdentifier:ID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}
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
        [responseObject writeToFile:@"/Users/tianfengpan/Desktop/app.plist" atomically:YES];
        NSArray *listArray = responseObject[@"list"];
        for (NSDictionary *listDict in listArray) {
            SP_TopicModel *topicModel = [SP_TopicModel topicModelWithDict:listDict];
            SP_TopicViewModel *viewModel = [[SP_TopicViewModel alloc] init];
            viewModel.topicModel = topicModel;
            [self.topicArray addObject:viewModel];
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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
