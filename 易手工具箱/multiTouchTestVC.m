//
//  multiTouchTestVC.m
//  易手工具箱
//
//  Created by fungjack on 2017/3/30.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "multiTouchTestVC.h"

@implementation multiTouchTestVC

- (void)viewDidLoad{
    [super viewDidLoad];
    _totalTouchNumber = 0;//给最大触控数赋初值0
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    _nowTouchNumber = (int)[allTouches count];
    
    if (!_Timer) {
        _Timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeLabel) userInfo:nil repeats:YES];
    }
}

- (void)changeLabel{
    if (_nowTouchNumber > _totalTouchNumber){//如果当前触控数大于最大触控数
        _totalTouchNumber = _nowTouchNumber;
        _messageLabelDown.text = [NSString stringWithFormat:@"最大触摸点数：%d", _totalTouchNumber];
    }
}

@end
