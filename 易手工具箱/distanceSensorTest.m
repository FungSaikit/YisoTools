//
//  distanceSensorTest.m
//  易手工具箱
//
//  Created by fungjack on 2017/4/9.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "distanceSensorTest.h"


@implementation distanceSensorTest

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];//启用距离感应器
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(proximitySensorChange) userInfo:nil repeats:YES];
}

- (void)proximitySensorChange//当距离感应器状态变化时
{
    if ([[UIDevice currentDevice] proximityState] == YES) {
        _statusLabel.text = @"遮挡";
        
    }else{
        _statusLabel.text = @"远离";
    }
}

@end
