//
//  WX_CAReplicatorLayerController.m
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/24.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#import "WX_CAReplicatorLayerController.h"

@interface WX_CAReplicatorLayerController ()
@end

@implementation WX_CAReplicatorLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    //[self useCAReplicatorLayer];
    
    // CAReplicatorLayer的应用:反射
    [self.view addSubview:self.containerView];
    self.containerView.center = self.view.center;
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:self.containerView.bounds];
    img.image = [UIImage imageNamed:@"FRlogo3"];
    [self.containerView addSubview:img];
   
    
}


- (void)useCAReplicatorLayer {
    // create a replicator layer and add it to our view
    CAReplicatorLayer *replicaorLayer = [CAReplicatorLayer layer];
    replicaorLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:replicaorLayer];
    
    
    replicaorLayer.instanceCount = 10;
    
    CATransform3D transform = CATransform3DIdentity;
    
    transform = CATransform3DTranslate(transform, 0, 185, 0);
    transform = CATransform3DRotate(transform,2 * M_PI / 10.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -185, 0);
    
    replicaorLayer.instanceTransform = transform;
    
    
    //apply a color shift for each instance
    replicaorLayer.instanceBlueOffset = -0.1;
    replicaorLayer.instanceGreenOffset = -0.1;
    
    
    //create a sublayer and place it inside the replicator
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100, 100.0f, 100.0f);
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [replicaorLayer addSublayer:layer];

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
