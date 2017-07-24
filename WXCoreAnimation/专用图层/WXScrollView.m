//
//  WXScrollView.m
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/24.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#import "WXScrollView.h"

@implementation WXScrollView

+ (Class)layerClass {
    return [CAScrollLayer class];
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup{
    
    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panActionHandle:)];
    [self addGestureRecognizer:panGest];
}

- (void)panActionHandle:(UIPanGestureRecognizer *)panGest {
    
    CGPoint offSet = self.bounds.origin;
    CGPoint panOffSet = [panGest translationInView:self];
    
    offSet.x -= panOffSet.x;
    offSet.y -= panOffSet.y;
    
    CAScrollLayer *scrollLayer = (CAScrollLayer *)self.layer;
    
    [scrollLayer scrollToPoint:offSet];
    
    [panGest setTranslation:CGPointZero inView:self];
    
}

@end
