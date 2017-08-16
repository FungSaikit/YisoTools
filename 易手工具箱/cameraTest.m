//
//  cameraTest.m
//  易手工具箱
//
//  Created by fungjack on 2017/4/25.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "cameraTest.h"

@implementation cameraTest

- (void)viewDidLoad{
    [super viewDidLoad];
    _cameraView = [[CameraSessionView alloc] initWithFrame:self.view.frame];
    _cameraView.delegate = self;
    [self.view addSubview:_cameraView];
}

@end
