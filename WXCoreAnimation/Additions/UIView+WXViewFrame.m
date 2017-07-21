//
//  UIView+WXView.m
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/21.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#import "UIView+WXViewFrame.h"

#define WXX self.frame.origin.x
#define WXY self.frame.origin.y
#define WXWIDTH self.frame.size.width
#define WXHEIGHT self.frame.size.height
#define WXRECT(x,y,width,height) CGRectMake(x, y, width, height)

@implementation UIView (WXViewFrame)

- (void)setWx_x:(CGFloat)wx_x {
    self.frame = WXRECT(wx_x,WXY, WXWIDTH, WXHEIGHT);
}

- (CGFloat)wx_x {
    return WXX;
}


- (void)setWx_y:(CGFloat)wx_y {
    
    self.frame = WXRECT(WXX, wx_y, WXWIDTH, WXHEIGHT);
   
}
- (CGFloat)wx_y {
    return WXY;
}

- (void)setWx_width:(CGFloat)wx_width {
    self.frame = WXRECT(WXX, WXY, wx_width, WXHEIGHT);
}

- (CGFloat)wx_width {
    return WXWIDTH;
}

- (void)setWx_height:(CGFloat)wx_height {
    self.frame = WXRECT(WXX, WXY, WXWIDTH, wx_height);
}

- (CGFloat)wx_height {
    return WXHEIGHT;
}

- (void)setWx_size:(CGSize)wx_size {
    
    self.frame = WXRECT(WXX, WXY, wx_size.width, wx_size.height);
}

- (CGSize)wx_size {
    return self.frame.size;
}

- (void)setWx_origin:(CGPoint)wx_origin {
    self.frame = WXRECT(wx_origin.x, wx_origin.y, WXWIDTH, WXHEIGHT);
}

- (CGPoint)wx_origin {
    return self.frame.origin;
}


- (void)setWx_frame:(CGRect)wx_frame {
    self.frame = wx_frame;
}

- (CGRect)wx_frame {
    return self.frame;
}

- (void)setWx_bounds:(CGRect)wx_bounds {
    self.bounds = wx_bounds;
}

- (CGRect)wx_bounds {
    return self.bounds;
}


@end
