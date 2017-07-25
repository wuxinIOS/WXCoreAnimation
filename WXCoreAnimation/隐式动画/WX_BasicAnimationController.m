//
//  WX_BasicAnimationController.m
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/25.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#import "WX_BasicAnimationController.h"

@interface WX_BasicAnimationController ()
@property (nonatomic, strong) UIButton *changedColorBtn;
@property (strong, nonatomic)  UIView *layerView;
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation WX_BasicAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.layerView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, self.containerLayerView.bounds.size.width - 2 * 10, 100)];
    self.layerView.backgroundColor = [UIColor whiteColor];
    [self.containerLayerView addSubview:self.layerView];
    
    self.changedColorBtn = [UIButton cz_textButton:@"改变颜色" fontSize:15 normalColor:[UIColor redColor] highlightedColor:[UIColor redColor]];
    self.changedColorBtn.frame = CGRectMake(10, self.layerView.wx_height + 100, self.layerView.wx_width, 20);
    [self.containerLayerView addSubview:self.changedColorBtn];
    [self.changedColorBtn addTarget:self action:@selector(changeColorButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = self.layerView.bounds;
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.layerView.layer addSublayer:self.colorLayer];
    
    
                                  
}


- (void)changeColorButton:(UIButton *)sender {
    // begin a new transaction
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0f];
    
    //颜色变化完成后，执行的动画
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.colorLayer.affineTransform = transform;
    }];
    
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    //self.layerView.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    [CATransaction commit];
}

@end
