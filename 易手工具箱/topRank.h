//
//  topRank.h
//  易手工具箱
//
//  Created by fungjack on 2017/5/6.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JXBarChartView.h"
#import <PNChart/PNChart.h>
#import <BmobSDK/Bmob.h>

@interface topRank : UIViewController

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (strong, nonatomic) IBOutlet UILabel *loadingLabel;


@end
