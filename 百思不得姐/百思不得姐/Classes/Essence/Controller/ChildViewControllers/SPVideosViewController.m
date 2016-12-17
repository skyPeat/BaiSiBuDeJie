//
//  SPVideosViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/11.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPVideosViewController.h"

@interface SPVideosViewController ()

@end

@implementation SPVideosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"spsp";
    
    return cell;
}
@end
