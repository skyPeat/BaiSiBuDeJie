//
//  SPAllViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/11.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPAllViewController.h"
#import <MJExtension/MJExtension.h>
#import "SPTopicItem.h"
#import "SPTopicViewItem.h"
#import "SPTopicCell.h"
@interface SPAllViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation SPAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    注册cell
    [self.tableView registerClass:[SPTopicCell class] forCellReuseIdentifier:@"cell"];
//    设置tableview的内边距
    self.tableView.contentInset = UIEdgeInsetsMake(SP_TopH + 20, 0, 0, 0);
//    加载数据
    [self loadData];
//    添加子控件
    [self setUpBottomRefresh];
//   上拉加载数据
    
}
-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
-(void)loadData{
//    创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager SP_manager];
//    拼接参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    parameter[@"a"] = @"list";
    parameter[@"c"] = @"data";
    parameter[@"type"] = @"41";
//    maxtime	true	string	第一次加载帖子时候不需要传入此关键字，当需要加载下一页时：需要传入加载上一页时返回值字段“maxtime”中的内容。
   
//    发送请求
    [manager SP_GET:@"http://api.budejie.com/api/api_open.php" parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        [responseObject writeToFile:@"/Users/tianfengpan/Desktop/app.plist" atomically:YES];
        NSArray *array = responseObject[@"list"];
        NSMutableArray *dataArray = [SPTopicItem mj_objectArrayWithKeyValuesArray:array];
        for (SPTopicItem *item in dataArray) {
            SPTopicViewItem *viewItem = [[SPTopicViewItem alloc] init];
            viewItem.item = item;
            [self.dataArray addObject:viewItem];
        }
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
//    解析数据
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SPTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.item = self.dataArray[indexPath.row];
   
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self.dataArray[indexPath.row] cellHeight];
}
-(void)setUpBottomRefresh{
    UIView *bottomRereshView = [[UIView alloc] init];
    bottomRereshView.backgroundColor = [UIColor lightGrayColor];
    bottomRereshView.frame = CGRectMake(0, 0, SP_ScreenW, SP_BottomH);
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor darkGrayColor];
    label.text = @"上拉加载更多数据";
    NSDictionary *attri = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};
    CGSize textSize = [label.text sizeWithAttributes:attri];

    CGFloat labelW = textSize.width;
    label.frame = CGRectMake((SP_ScreenW - labelW) * 0.5, 0, labelW, SP_BottomH);
    [bottomRereshView addSubview:label];
    
    UIActivityIndicatorView *juhuaView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    juhuaView.center = CGPointMake(label.SP_x - 10, bottomRereshView.SP_height * 0.5);
    [juhuaView startAnimating];
    [bottomRereshView addSubview:juhuaView];
    
    self.tableView.tableFooterView = bottomRereshView;
}
@end
