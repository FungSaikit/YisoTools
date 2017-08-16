//
//  multiTouchTestVC.h
//  易手工具箱
//
//  Created by fungjack on 2017/3/30.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Foundation/NSDate.h>

@interface multiTouchTestVC : UIViewController
@property int totalTouchNumber;
@property int nowTouchNumber;
@property (strong, nonatomic) IBOutlet UILabel *messageLabelDown;
@property (strong, nonatomic) NSTimer *Timer;

@end
