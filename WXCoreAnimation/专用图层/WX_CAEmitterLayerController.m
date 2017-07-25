//
//  WX_CAEmitterLayerController.m
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/25.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

/**
 CAEmitterLayer是一个高性能的粒子引擎，被用来创建实时例子动画如：烟雾，火，雨等等这些效果
 */

#import "WX_CAEmitterLayerController.h"

@interface WX_CAEmitterLayerController ()

@end

@implementation WX_CAEmitterLayerController

- (void)viewDidLoad {
    [super viewDidLoad];


    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.frame = self.containerLayerView.bounds;
    [self.containerLayerView.layer addSublayer:emitterLayer];
    
    emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width * 0.5, emitterLayer.frame.size.height * 0.5);
   
    emitterLayer.emitterZPosition = 10;
    
    
    /** renderMode，控制着在视觉上粒子图片是如何混合的
     kCAEmitterLayerUnordered
     kCAEmitterLayerOldestFirst
     kCAEmitterLayerOldestLast
     kCAEmitterLayerBackToFront
     kCAEmitterLayerAdditive
     */
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    /**emitterShape values
    kCAEmitterLayerPoint
    kCAEmitterLayerLine
    kCAEmitterLayerRectangle
    kCAEmitterLayerCuboid
    kCAEmitterLayerCircle
    kCAEmitterLayerSphere
     */
    emitterLayer.emitterShape = kCAEmitterLayerCuboid;
    
    
    CAEmitterCell *emitterCell = [[CAEmitterCell alloc]init];
    emitterCell.contents = (__bridge id)[UIImage imageNamed:@"Spark"].CGImage;
    
    emitterCell.birthRate = 150;
    emitterCell.lifetime = 5.0;
    emitterCell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    emitterCell.alphaSpeed = -0.4;
    emitterCell.velocity = 50;
    emitterCell.velocityRange = 50;
    emitterCell.emissionRange = M_PI * 2;
    
    //add particle template to emitter
    emitterLayer.emitterCells = @[emitterCell];
    
    
    
    

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
