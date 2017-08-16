//
//  touchTestVC.h
//  易手工具箱
//
//  Created by fungjack on 2017/3/29.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Foundation/NSDate.h>

@interface touchTestVC : UIViewController

@property NSInteger touchX;
@property NSInteger touchY;
@property (strong, nonatomic) NSTimer *Timer;
@property (strong, nonatomic) IBOutlet UIView *touchView;

@end
