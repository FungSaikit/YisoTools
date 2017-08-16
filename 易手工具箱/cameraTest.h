//
//  cameraTest.h
//  易手工具箱
//
//  Created by fungjack on 2017/4/25.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomizableCamera/Camera View/CameraSessionView.h"

@interface cameraTest : UIViewController <CACameraSessionDelegate>

@property (nonatomic, strong) CameraSessionView *cameraView;


@end
