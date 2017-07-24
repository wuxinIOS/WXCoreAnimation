//
//  WX_CAScrollLayerViewController.m
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/24.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#import "WX_CAScrollLayerViewController.h"
#import "WXScrollView.h"

@interface WX_CAScrollLayerViewController ()
@property (nonatomic, strong) WXScrollView *scrollView;
@end

@implementation WX_CAScrollLayerViewController

- (WXScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[WXScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.wx_width, self.view.wx_width)];
        _scrollView.center = self.view.center;
        _scrollView.backgroundColor = [UIColor whiteColor];
        
    }
    return  _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.scrollView];
    

    UIImage *image = [UIImage imageNamed:@"screen"];
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imgView.image = image;
    [self.scrollView addSubview:imgView];

    [self.scrollView.layer scrollPoint:CGPointMake(10, 10)];

    /** 
     scrollPoint:方法从图层树中查找并找到第一个可用的CAScrollLayer，然后滑动它使得指定点成为可视的。
     scrollRectToVisible:方法实现了同样的事情只不过是作用在一个矩形上的
     visibleRect属性决定图层（如果存在的话）的哪部分是当前的可视区域
     */
    
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
