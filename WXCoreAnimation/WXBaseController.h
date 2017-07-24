//
//  WXBaseController.h
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/21.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXLayerView.h"


@interface WXBaseController : UIViewController
@property (nonatomic, strong)WXLayerView *containerView;
@property (nonatomic, strong)UIView *containerLayerView;
@end
