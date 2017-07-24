//
//  WXController.m
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/21.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#import "WXController.h"

@interface WXController ()
@property (nonatomic, strong)NSArray *vcArray;
@end

@implementation WXController

- (NSArray *)vcArray {
    if (!_vcArray) {
        _vcArray = @[
                     @{@"name":@"CALayer相关知识",@"vcName":@[@"ViewController"],@"content":@[@"CALayer相关知识(2D,3D转换)"]},
  
                     @{@"name":@"专用图层",@"vcName":@[@"WX_CAShapLayerController",@"WX_CATextLayerController",@"WX_CAReplicatorLayerController",@"WX_CAScrollLayerViewController",@"WX_CATiledLayerController"],@"content":@[@"CASapeLayer类",@"CATextLayer类",@"CAReplicatorLayer类",@"CAScrollLayer类",@"CATiledLayer类"]},
                     
                     ];
    }
    return _vcArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.vcArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = self.vcArray[section];
    NSArray *array = dic[@"content"];
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *dic = self.vcArray[indexPath.section];
    NSArray *array = dic[@"content"];
    cell.textLabel.text = array[indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dic = self.vcArray[section];
    NSString *title = dic[@"name"];
    return title;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.vcArray[indexPath.section];
    NSArray *names = dic[@"vcName"];
    UIViewController *vc = [[NSClassFromString(names[indexPath.row]) alloc] init];
    NSArray *titleArray = dic[@"content"];
    vc.title = titleArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
