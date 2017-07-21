//
//  ViewController.m
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/20.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//



/**
 原文链接:https://zsisme.gitbooks.io/ios-/content/chapter2/custom-drawing.html
 
 */

#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5

#import "ViewController.h"
#import <GLKit/GLKit.h>

@interface ViewController ()<CALayerDelegate>
@property(nonatomic, strong)UIView *layerView;

@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (nonatomic, strong) CALayer *layer;

@property (nonatomic, strong) UIView *layerView2;


@property (nonatomic, strong)NSMutableArray *viewArray;
@property (nonatomic, strong) UIView *containerView;

@end


@implementation ViewController

- (NSMutableArray *)viewArray {
    if (!_viewArray) {
        _viewArray = [NSMutableArray arrayWithCapacity:6];
    }
    return _viewArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.redView.hidden = YES;
    self.blueView.hidden = YES;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //[self setupLayerView];
    
    [self setupView];
    [self addFace];
    
    
}


#pragma mark -- 构建立方体

- (void)addFace{
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1 / 500;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    self.containerView.layer.sublayerTransform = perspective;
    
    
    // add face 1
    [self addFace:0 withTransform:CATransform3DMakeTranslation(0, 0, 100)];
    
    
    // add face 2
    CATransform3D transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    
    
    //add cube face 3
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    
    
    //add cube face 4
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    
    //add cube face 5
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    
    //add cube face 6
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
    
    
    
    
}

//为立方体添加平面
- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform{
    
    UIView *face = self.viewArray[index];
    
    [self.containerView addSubview:face];
    
    CGSize containerSize = self.containerView.bounds.size;
    
    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    
    face.layer.transform = transform;
    
    [self applyLightingToFace:face.layer];
    
    
    if (index == 2) {
        face.userInteractionEnabled = YES;
    } else {
        face.userInteractionEnabled = NO;
    }
    
    
    
}

- (void)applyLightingToFace:(CALayer *)face
{
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)
    //译者注：GLKMatrix4和CATransform3D内存结构一致，但坐标类型有长度区别，所以理论上应该做一次float到CGFloat的转换，感谢[@zihuyishi](https://github.com/zihuyishi)同学~
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
}



- (void)setupView {
    
    for (int i = 0; i<6; i++) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        view.backgroundColor = [UIColor whiteColor];
        
        if (i == 2) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CGRectMake(0, 0, 100, 100);
            [btn setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:30];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.center = view.center;
            btn.backgroundColor = [UIColor blueColor];
            [view addSubview:btn];
            
        } else {
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
            label.text = [NSString stringWithFormat:@"%d",i+1];
            label.textAlignment = NSTextAlignmentCenter;
            label.center = view.center;
            
            label.font = [UIFont systemFontOfSize:30];
            label.textColor = [UIColor redColor];
            //label.backgroundColor = [UIColor redColor];
            [view addSubview:label];
        }
        
        
        [self.viewArray addObject:view];
        
    }
    
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.containerView.center = self.view.center;
    self.containerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.containerView];
   
    
}

- (void)btnAction:(UIButton *)sender {
    
    NSLog(@"我被点击了");
}

- (void)setupLayerView{
    self.layerView = [[UIView alloc]initWithFrame:CGRectMake(5, 100, 150,150)];
    self.layerView.backgroundColor = [UIColor whiteColor];
    //self.layerView.layer.cornerRadius = 75;
    //    self.layerView.center = self.view.center;
    [self.view addSubview: self.layerView];
    
    
    
    self.layerView2 = [[UIView alloc]initWithFrame:CGRectMake(160, 100, 150,150)];
    self.layerView2.backgroundColor = [UIColor whiteColor];
    //self.layerView.layer.cornerRadius = 75;
    //    self.layerView.center = self.view.center;
    [self.view addSubview: self.layerView2];
    
    
    
    [self setupImgByLayerContents];
    
    
    //Custom Drawing 绘图
    //[self customDrawing];
    
    //图层的点击事件
    //[self hitTesting];
    
    
    //图层蒙版
    

}

#pragma mark -- 图层点击事件
- (void)hitTesting{
   
    self.layer = [[CALayer alloc]init];
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    self.layer.frame = CGRectMake(20, 20, 60, 60);
    [self.layerView.layer addSublayer:self.layer];
    self.layer.shadowOpacity = 0.6;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //[self useContainsPoint:point];
   // [self useHitTestingWithPoint:point];
    
    
   
}

//使用hitTest判断是否在图层上
- (void)useHitTestingWithPoint:(CGPoint)point{
    
    /**
     -hitTest:方法同样接受一个CGPoint类型参数，而不是BOOL类型，它返回图层本身，或者包含这个坐标点的叶子节点图层。这意味着不再需要像使用-containsPoint:那样，人工地在每个子图层变换或者测试点击的坐标。如果这个点在最外面图层的范围之外，则返回nil。
     
     */
    
    CALayer *layer = [self.view.layer hitTest:point];
    
    if (layer == self.layer) {
        [[[UIAlertView alloc]initWithTitle:@"提示" message:@"hit in red layer" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil] show];
    } else if (layer == self.layerView.layer){
        [[[UIAlertView alloc]initWithTitle:@"提示" message:@"hit in red super layer" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil] show];
    } else if (layer == self.view.layer) {
         [[[UIAlertView alloc]initWithTitle:@"提示" message:@"hit in view-layer" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil] show];
    }
    
    
    
}


//使用containsPoint来判断点击是否在图层上
- (void)useContainsPoint:(CGPoint)point{
    
    //转换坐标
    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
    
    if ([self.layerView.layer containsPoint:point]) {
        
        //继续转换
        point = [self.layer convertPoint:point fromLayer:self.layerView.layer];
        
        if ([self.layer containsPoint:point]) {
            [[[UIAlertView alloc]initWithTitle:@"提示" message:@"hit in red layer" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil] show];
        } else {
            [[[UIAlertView alloc]initWithTitle:@"提示" message:@"hit in red super layer" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil] show];
        }
        
    } else {
        [[[UIAlertView alloc]initWithTitle:@"提示" message:@"hit in view-layer" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil] show];
    }
    
}

- (void)customDrawing {
    /**
     
     当需要被重绘时，CALayer会请求它的代理给他一个寄宿图来显示。它通过调用下面这个方法做到的:
     (void)displayLayer:(CALayerCALayer *)layer;
     
     如果代理不实现-displayLayer:方法，CALayer就会转而尝试调用下面这个方法：
     - (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;
     在调用这个方法之前，CALayer创建了一个合适尺寸的空寄宿图（尺寸由bounds和contentsScale决定）和一个Core Graphics的绘制上下文环境，为绘制寄宿图做准备，他作为ctx参数传入。
     
     */
    CALayer *layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(50, 50, 50, 50);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.contentsScale = [UIScreen mainScreen].scale;
    layer.delegate = self;
    [self.layerView.layer addSublayer:layer];
    

    
    [layer display];

}

#pragma mark -- CALayerDelegate协议


//- (void)displayLayer:(CALayer *)layer {
//    layer.contents =(__bridge id) [UIImage imageNamed:@"180X180"].CGImage;
//    
//}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}


//contents相关的属性
- (void)setupImgByLayerContents{
    
    UIImage *img = [UIImage imageNamed:@"FRlogo3"];
    
    
    self.layerView.layer.contents = (__bridge id)img.CGImage;
    self.layerView2.layer.contents = (__bridge id)img.CGImage;

    
    /** contentsGravity:
     
     kCAGravityCenter
     kCAGravityTop
     kCAGravityBottom
     kCAGravityLeft
     kCAGravityRight
     kCAGravityTopLeft
     kCAGravityTopRight
     kCAGravityBottomLeft
     kCAGravityBottomRight
     kCAGravityResize
     kCAGravityResizeAspect
     kCAGravityResizeAspectFill
     */
    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;//在retain屏幕上正常显示必须这样设置
    self.layerView.layer.masksToBounds = YES;//是否截除超出部分  相当于UIView 中的 clipsToBounds
    //    self.layerView.layer.contentsRect = CGRectMake(0, 0.8, 1, 1);//对图片进行裁剪，坐标是单位坐标，整个图片就是一个坐标系统。（0，0，1，1）可以用来截图
    
    //    self.layerView.layer.contentsCenter = CGRectMake(0.25, 0.25, 0.5, 0.5);//相当于九切片和UIImgae的resizableImageWithCapInsets方法一样的效果

    //仿射变换 （2D--affineTransform）
    //[self affineTransform];

    //3D转换
    [self transform3D];
    
    
}

#pragma mark -- 3D转换

- (void)transform3D {
    
    
    
    
    CATransform3D transform = CATransform3DIdentity;
    
    transform.m34 = - 1 / 600.0;//透视效果
    
    
    self.view.layer.sublayerTransform = transform;
    
    
    self.layerView.layer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(0), 0, 1, 0);
    
    self.layerView2.layer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(180), 0, 1, 0);
    
    //self.layerView2.layer.doubleSided = NO;
    
    //透视投影
    /** 
     CATransform3D的透视效果通过一个矩阵中一个很简单的元素来控制：m34
     
     
     叫做doubleSided的属性来控制图层的背面是否要被绘制
     
     */
    
}

#pragma mark -- 仿射变换
- (void)affineTransform{
    /** 
     
     做一个既要缩放又要旋转的变换，这就会非常有用了。例如下面几个函数：
     CGAffineTransformRotate(CGAffineTransform t, CGFloat angle)
     CGAffineTransformScale(CGAffineTransform t, CGFloat sx, CGFloat sy)
     CGAffineTransformTranslate(CGAffineTransform t, CGFloat tx, CGFloat ty)
     当操纵一个变换的时候，初始生成一个什么都不做的变换很重要--也就是创建一个CGAffineTransform类型的空值，矩阵论中称作单位矩阵，Core Graphics同样也提供了一个方便的常量：
     CGAffineTransformIdentity
     最后，如果需要混合两个已经存在的变换矩阵，就可以使用如下方法，在两个变换的基础上创建一个新的变换：
     CGAffineTransformConcat(CGAffineTransform t1, CGAffineTransform t2);
     
     */
    
    
    
    //仿射变换 2D变换 affineTransform
    /**
     
     CGAffineTransform中的“仿射”的意思是无论变换矩阵用什么值，图层中平行的两条线在变换之后任然保持平行
     
     */
    //单一变换
    //self.layerView.layer.affineTransform = CGAffineTransformMakeRotation(M_PI_4);
    
    //混合变换
        //先缩小50%，再旋转30度，最后向右移动200个像素
    CGAffineTransform transform = CGAffineTransformIdentity;//单位矩阵
    
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    
    transform = CGAffineTransformRotate(transform, M_PI / 180 * 30);
    
    transform = CGAffineTransformTranslate(transform, 100, 0);
    
    self.layerView.layer.affineTransform = transform;
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
