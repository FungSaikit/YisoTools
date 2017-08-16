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
    NSString *URLString = [NSString stringWithFormat:@"http://m.baidu.com/s?word=%@", modelInfo];
    //NSLog(URLString);
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
    self.webView.scrollView.delegate = self;
    [_activityIndicator setHidesWhenStopped:YES];
    [_activityIndicator startAnimating];
}

- (IBAction)clickToBack:(id)sender {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
    else{
        [self.navigationController setNavigationBarHidden:NO];
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityIndicator stopAnimating];//转圈圈停止动画
    _webNameLabel.text = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}


//下面是自动隐藏状态栏
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _dragOffSet = _webView.scrollView.contentOffset.y;//获取滑动初始的Y轴
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(_webView.scrollView.contentOffset.y > _dragOffSet){//如果是向下拉，无论是快拉还是慢拉，都隐藏NavigationBar和StatusBar
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    if(_webView.scrollView.contentOffset.y < _dragOffSet){//如果是向上拉而且是快拉，显示NavigationBar和StatusBar
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
//        [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    }
//}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    if(_webView.scrollView.contentOffset.y < _dragOffSet){//如果是向上拉而且是快拉，显示NavigationBar和StatusBar
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
    }
}

@end
