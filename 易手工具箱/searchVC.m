//
//  searchVC.m
//  易手工具箱
//
//  Created by fungjack on 2017/2/26.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "searchVC.h"

@implementation searchVC

-(void)viewDidLoad{
    [super viewDidLoad];
    
    NSString *modelInfo = [getInformation getModelInfo];
    modelInfo = [modelInfo substringFromIndex:5];
    NSString *URLString = [NSString stringWithFormat:@"http://www.baidu.com/s?word=%@", modelInfo];
    //NSLog(URLString);
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
}


@end
