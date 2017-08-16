//
//  searchVC.h
//  易手工具箱
//
//  Created by fungjack on 2017/2/26.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "getInformation.h"


@interface searchVC : UIViewController <UIWebViewDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;
@property int dragOffSet;
@property (strong, nonatomic) IBOutlet UILabel *webNameLabel;
- (IBAction)clickToBack:(id)sender;

@end

