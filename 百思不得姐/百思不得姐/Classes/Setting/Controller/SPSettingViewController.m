//
//  SPSettingViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPSettingViewController.h"
#import "SP_FileManager.h"
#define cachePath NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject
static NSString *const ID = @"cell";
@interface SPSettingViewController ()

@end

@implementation SPSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.text = [self getFilesizeStr];
    return cell;
}
#pragma mark- 计算缓存的大小
-(NSString *)getFilesizeStr{
    //    0、获取缓存文件的路径
    NSInteger totalSize = [SP_FileManager getDirectorySize:cachePath];
    NSString *str = @"清除缓存";
    if (totalSize > 1000 * 1000) {
        CGFloat totalSizeF = totalSize / 1000.0 / 1000.0;
        str = [NSString stringWithFormat:@"%@(%.1fMB)",str,totalSizeF];
    }else if (totalSize > 1000){
        CGFloat totalSizeF = totalSize / 1000.0;
        str = [NSString stringWithFormat:@"%@(%.1fKB)",str,totalSizeF];
    }else if(totalSize > 0){
         str = [NSString stringWithFormat:@"%@(%ldB)",str,totalSize];
    }
    return str;
}
#pragma mark- 清除缓存
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [SP_FileManager removeDirectoryPath:cachePath];
    [self.tableView reloadData];
}
@end
