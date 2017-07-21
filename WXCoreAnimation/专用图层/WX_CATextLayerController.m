//
//  WX_CATextLayerController.m
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/21.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#import "WX_CATextLayerController.h"


@interface WX_CATextLayerController ()
@property (nonatomic, strong) UIView *labelView;
@end

@implementation WX_CATextLayerController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.labelView.center = self.view.center;
    NSLog(@"%f",self.labelView.wx_x);
    // Do any additional setup after loading the view.
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
