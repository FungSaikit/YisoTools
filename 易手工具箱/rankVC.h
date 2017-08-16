//
//  rankVC.h
//  易手工具箱
//
//  Created by fungjack on 2017/4/10.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <stdlib.h>
#import <PNChart/PNChart.h>
#import <BmobSDK/Bmob.h>
#import "getInformation.h"


@interface rankVC : UIViewController {
    int testArray[50000];
    double testArray2[50000];
}
@property (strong, nonatomic) IBOutlet UILabel *Score;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) PNBarChart *rankChart;
@property (strong, nonatomic) NSNumber *chartResult;
@property (strong, nonatomic) IBOutlet UITextField *nameText;

- (IBAction)startButton:(id)sender;
- (IBAction)uploadButton:(id)sender;


@end
