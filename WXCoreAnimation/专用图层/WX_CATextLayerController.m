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
    self.labelView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.labelView];
    
    [self setupCATextLayer];

}

- (void)setupCATextLayer{
    CATextLayer *textLayer = [[CATextLayer alloc]init];
    textLayer.frame = self.labelView.bounds;
    [self.labelView.layer addSublayer:textLayer];
    
    // set text attributes
    textLayer.foregroundColor = [UIColor whiteColor].CGColor;
    
    textLayer.wrapped = YES;
    //文字位置
    textLayer.alignmentMode = kCAAlignmentLeft;

    //省略模式
    textLayer.truncationMode = kCATruncationEnd;
    
       
    //choose a font
    UIFont *font = [UIFont systemFontOfSize:20];
    
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    //choose some text
    NSString *text = @"用户界面是无法从一个单独的图片里面构建的。一个设计良好的图标能够很好地表现一个按钮或控件的意图，不过你迟早都要需要一个不错的老式风格的文本标签。\
    如果你想在一个图层里面显示文字，完全可以借助图层代理直接将字符串使用Core Graphics写入图层的内容（这就是UILabel的精髓）。如果越过寄宿于图层的视图，直接在图层上操作，那其实相当繁琐。你要为每一个显示文字的图层创建一个能像图层代理一样工作的类，还要逻辑上判断哪个图层需要显示哪个字符串，更别提还要记录不同的字体，颜色等一系列乱七八糟的东西。";

    textLayer.string = text;
    
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    
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
