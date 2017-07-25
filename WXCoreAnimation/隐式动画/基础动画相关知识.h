//
//  基础动画相关知识.h
//  WXCoreAnimation
//
//  Created by BlackEr Gray on 17/7/25.
//  Copyright © 2017年 BlackEr Gray. All rights reserved.
//

#pragma mark -- 隐式动画
/**
 
 隐式动画是因为我们并没有指定任何动画的类型。我们仅仅改变了一个属性，然后Core Animation来决定如何并且何时去做动画。
 
 当你改变一个属性，Core Animation是如何判断动画类型和持续时间的呢？实际上动画执行的时间取决于当前 事务 的设置，动画类型取决于图层行为。
 事务 实际上是Core Animation用来包含一系列属性动画集合的机制，任何用指定事务去改变可以做动画的图层属性都不会立刻发生变化，而是当事务一旦提交的时候开始用一个动画过渡到新值。
 事务是通过 CATransaction 类来做管理，这个类的设计有些奇怪，不像你从它的命名预期的那样去管理一个简单的事务，而是管理了一叠你不能访问的事务。CATransaction没有属性或者实例方法，并且也不能用+alloc和-init方法创建它。但是可以用+begin和+commit分别来入栈或者出栈。
 任何可以做动画的图层属性都会被添加到栈顶的事务，你可以通过+setAnimationDuration:方法设置当前事务的动画时间，或者通过+animationDuration方法来获取值（默认0.25秒）。
 Core Animation在每个run loop周期中自动开始一次新的事务（run loop是iOS负责收集用户输入，处理定时器或者网络事件并且重新绘制屏幕的东西），即使你不显式的用[CATransaction begin]开始一次事务，任何在一次run loop循环中属性的改变都会被集中起来，然后做一次0.25秒的动画。
 
 
 */
