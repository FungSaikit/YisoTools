//
//  colorTestVC.m
//  易手工具箱
//
//  Created by fungjack on 2017/3/16.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "colorTestVC.h"

@implementation colorTestVC

- (void)viewDidLoad{
    _pageIndex = 0;//执行此view时给pageIndex赋初值
    [super viewDidLoad];
    _backgroundView.backgroundColor = [UIColor redColor];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];//隐藏状态栏
    [self.navigationController setNavigationBarHidden:YES];//隐藏导航栏
    
}

- (IBAction)tapToChange:(id)sender {
    _pageIndex++;
    if (_pageIndex == 1) {
        _backgroundView.backgroundColor = [UIColor greenColor];
        
    }
    else if (_pageIndex == 2){
        _backgroundView.backgroundColor = [UIColor blueColor];
    }
    else if (_pageIndex == 3){
        _backgroundView.backgroundColor = [UIColor yellowColor];
    }
    else if(_pageIndex == 4){
        _backgroundView.backgroundColor = [UIColor whiteColor];
    }
    else if(_pageIndex == 5){
        _backgroundView.backgroundColor = [UIColor blackColor];
    }
    else{
        [self.navigationController setNavigationBarHidden:NO];//显示状态栏
        [[UIApplication sharedApplication] setStatusBarHidden:NO];//显示导航栏
    }
}
@end
