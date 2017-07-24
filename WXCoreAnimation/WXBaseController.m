//
//  WXBaseController.m
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/21.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#import "WXBaseController.h"

@interface WXBaseController ()

@end

@implementation WXBaseController

- (WXLayerView *)containerView {
    if (!_containerView) {
        _containerView = [[WXLayerView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _containerView.backgroundColor = [UIColor whiteColor];
        _containerView.center = self.view.center;
    }
    return  _containerView;
}

- (UIView *)containerLayerView {
    if (!_containerLayerView) {
        _containerLayerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.width)];
        _containerLayerView.backgroundColor = [UIColor whiteColor];
        _containerLayerView.center = self.view.center;
    }
    return _containerLayerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];

    [self.view addSubview:self.containerLayerView];
    
}

- (void)dealloc {
    NSLog(@"%@被释放了",NSStringFromClass([self class]));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
