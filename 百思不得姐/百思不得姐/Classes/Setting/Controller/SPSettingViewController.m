//
//  SPSettingViewController.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/23.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPSettingViewController.h"
static NSString *ID = @"cell";
@interface SPSettingViewController ()

@end
@implementation SPSettingViewController
-(void)viewDidLoad{
    [super viewDidLoad];
//    0、设置导航条的内容
    [self setUpNavigationBar];
//    1、注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
}
-(void)setUpNavigationBar{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStyleDone target:self action:@selector(jump)];
    
    self.navigationItem.title = @"设置";
}
-(void)popVC{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)jump{
    UIViewController *testVC = [[UIViewController alloc] init];
    testVC.view.backgroundColor = randomColor
    [self.navigationController pushViewController:testVC animated:YES];
}
#pragma mark-  实现代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
//     获取文件的大小
    
    cell.textLabel.text =[self getFileSizeStr];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
-(NSString *)getFileSizeStr{
//    获取沙盒
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
//    获取default文件夹
    NSString *defaultPath = [cachePath stringByAppendingPathComponent:@"default"];
//    获取文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
//    获取文件夹下的所有文件
    NSArray *filesArray = [manager subpathsAtPath:defaultPath];
//    遍历文件
    NSInteger totalFilesSize = 0;
    
    for (NSString *subPath in filesArray) {
//        拼接路径
    NSString *filePath = [defaultPath stringByAppendingPathComponent:subPath];
        NSDictionary *attribute = [manager attributesOfItemAtPath:filePath error:nil];
        NSInteger size = [attribute fileSize];
        totalFilesSize += size;
    }
    NSLog(@"%zd",totalFilesSize);
    NSString *cellStr = @"清除缓存";
    if (totalFilesSize >= 1000 * 1000) {
        CGFloat totalSize = totalFilesSize / 1000.0 / 1000.0;
        cellStr = [NSString stringWithFormat:@"%@(%.1fMb)",cellStr,totalSize];
    }else if (totalFilesSize >= 1000){
        CGFloat totalSize = totalFilesSize / 1000.0;
        cellStr = [NSString stringWithFormat:@"%@(%.1fKb)",cellStr,totalSize];
    } else{
        cellStr = [NSString stringWithFormat:@"%@(%ldb)",cellStr,totalFilesSize];
    }
    return cellStr;
}

@end
