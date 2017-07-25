//
//  相关知识.h
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/21.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

/**
 原文链接:https://zsisme.gitbooks.io/ios-/content/chapter2/custom-drawing.html
 
 */

#pragma mark -- 坐标转换方法的使用
/**
 /**
 - (CGPoint)convertPoint:(CGPoint)point fromLayer:(CALayer *)layer;
 - (CGPoint)convertPoint:(CGPoint)point toLayer:(CALayer *)layer;
 - (CGRect)convertRect:(CGRect)rect fromLayer:(CALayer *)layer;
 - (CGRect)convertRect:(CGRect)rect toLayer:(CALayer *)layer;
 
 
 eg:
 例把UITableViewCell中的subview(btn)的frame转换到 controllerA中
 // controllerA 中有一个UITableView, UITableView里有多行UITableVieCell，cell上放有一个button
 // 在controllerA中实现:
 CGRect rc = [cell convertRect:cell.btn.frame toView:self.view];
 或
 CGRect rc = [self.view convertRect:cell.btn.frame fromView:cell];
 // 此rc为btn在controllerA中的rect
 
 或当已知btn时：
 CGRect rc = [btn.superview convertRect:btn.frame toView:self.view];
 或
 CGRect rc = [self.view convertRect:btn.frame fromView:btn.superview];
 
 */
#pragma mark --3D旋转方向的确认
/**
 CATransform3DRotate(transform, M_PI_4, 1, 0, 0):锚点所在的位置，沿x轴向屏幕 里 面旋转
 CATransform3DRotate(transform,-M_PI_4, 1, 0, 0):锚点所在的位置，沿x轴向屏幕 外 面旋转
 
 CATransform3DRotate(transform,-M_PI_4, 0, 1, 0):锚点所在的位置，沿y轴向屏幕 往左 旋转
 CATransform3DRotate(transform, M_PI_4, 0, 1, 0):锚点所在的位置，沿y轴向屏幕 往右 旋转
 
 CATransform3DRotate(transform,-M_PI_4, 0, 0, 1):锚点所在的位置，沿z轴 逆时针 旋转
 CATransform3DRotate(transform, M_PI_4, 0, 0, 1):锚点所在的位置，沿z轴 瞬时间 旋转
 
*/
