//
//  main.m
//  易手工具箱
//
//  Created by fungjack on 2017/2/8.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BmobSDK/Bmob.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        [Bmob registerWithAppKey:@"392e44f358e83785056fac3585913e1c"];//设置bmob key
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
