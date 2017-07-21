//
//  WX_CAShapLayerController.m
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/21.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#import "WX_CAShapLayerController.h"

#define viewCentX self.view.center.x
#define viewCentY self.view.center.y
#define WXPoint(x,y) CGPointMake(x, y)


@interface WX_CAShapLayerController ()
@end

@implementation WX_CAShapLayerController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self customPath];

}

- (void)customPath{
    
    CGRect rect = CGRectMake(50, 100, 200, 100);
    UIRectCorner corner = UIRectCornerTopLeft | UIRectCornerTopRight;
    CGSize radii = CGSizeMake(20, 20);
    UIBezierPath *roundRectPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:radii];
    
    
    UIBezierPath *bezier = [[UIBezierPath alloc]init];
    
    [bezier moveToPoint:WXPoint(viewCentX+40,viewCentY-80)];
    
    // draw Arc
    [bezier addArcWithCenter:CGPointMake(self.view.center.x, self.view.center.y - 80) radius:40 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    // draw vertical line
    [bezier moveToPoint:WXPoint(viewCentX,viewCentY-40)];
    [bezier addLineToPoint:WXPoint(viewCentX, viewCentY+40)];
    
    // draw horizontal line
    [bezier moveToPoint:WXPoint(viewCentX - 60, viewCentY)];
    [bezier addLineToPoint:WXPoint(viewCentX + 60, viewCentY)];
    
    // draw leg
    [bezier moveToPoint:WXPoint(viewCentX, viewCentY + 40)];
    [bezier addLineToPoint:WXPoint(viewCentX - 40, viewCentY + 80)];
    
    [bezier moveToPoint:WXPoint(viewCentX, viewCentY + 40)];
    [bezier addLineToPoint:WXPoint(viewCentX + 40, viewCentY + 80)];
    
    
    
    //creat shapeLayer
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.lineJoin = kCALineJoinBevel;
    shapeLayer.lineWidth = 5;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor lightGrayColor].CGColor;
    
    shapeLayer.path = bezier.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 使用CAShapeLayer有以下一些优点：
 
     渲染快速。CAShapeLayer使用了硬件加速，绘制同一图形会比用Core Graphics快很多。
     高效使用内存。一个CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存。
     不会被图层边界剪裁掉。一个CAShapeLayer可以在边界之外绘制。你的图层路径不会像在使用Core Graphics的普通CALayer一样被剪裁掉（如我们在第二章所见）。
     不会出现像素化。当你给CAShapeLayer做3D变换时，它不像一个有寄宿图的普通图层一样变得像素化。
 
 CAShapeLayer可以用来绘制所有能够通过CGPath来表示的形状。这个形状不一定要闭合，图层路径也不一定要不可破，事实上你可以在一个图层上绘制好几个不同的形状。你可以控制一些属性比如lineWith（线宽，用点表示单位），lineCap（线条结尾的样子），和lineJoin（线条之间的结合点的样子）
 
 
 
 
 */
@end
