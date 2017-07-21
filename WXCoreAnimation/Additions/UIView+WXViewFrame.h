//
//  UIView+WXView.h
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/21.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WXViewFrame)
/** x值  */
@property (nonatomic,assign) CGFloat wx_x;

/** y值 */
@property (nonatomic,assign) CGFloat wx_y;

/** width */
@property (nonatomic,assign) CGFloat wx_width;

/** heigth */
@property (nonatomic,assign) CGFloat wx_height;

/** size */
@property (nonatomic,assign) CGSize wx_size;

/** origin */
@property (nonatomic,assign) CGPoint wx_origin;

/** frame */
@property (nonatomic,assign) CGRect wx_frame;

/** bounds */
@property (nonatomic,assign) CGRect wx_bounds;

@end
