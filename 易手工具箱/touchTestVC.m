//
//  touchTestVC.m
//  易手工具箱
//
//  Created by fungjack on 2017/3/29.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "touchTestVC.h"

@implementation touchTestVC

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{//view出现之前
    [[UIApplication sharedApplication] setStatusBarHidden:YES];//隐藏statusbar
    [self.navigationController.view sendSubviewToBack:self.navigationController.navigationBar];//将navigationbar放到最后隐藏
}

- (void)draw{//Timer执行的画一个黑色小块方法
    UIView *blackPoint = [[UIView alloc] initWithFrame:CGRectMake(_touchX, _touchY, 10, 10)];
    [blackPoint setBackgroundColor:[UIColor blackColor]];
    [_touchView addSubview:blackPoint];
}

- (void)viewWillDisappear:(BOOL)animated{//view消失之前
    [[UIApplication sharedApplication] setStatusBarHidden:NO];//出现statusbar
    [self.navigationController.view bringSubviewToFront:self.navigationController.navigationBar];//将navigationbar拿回来最前面
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (!_Timer) {
        _Timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(draw) userInfo:nil repeats:YES];
    }
    
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象取一个对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    _touchX = point.x;
    _touchY = point.y;
    self.Timer.fireDate = [NSDate distantPast];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.Timer.fireDate = [NSDate distantFuture];
}

@end
