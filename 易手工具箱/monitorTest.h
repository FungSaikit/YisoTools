//
//  monitorTest.h
//  易手工具箱
//
//  Created by fungjack on 2017/3/14.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface monitorTest : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSArray *sectionArray;
    NSArray *detailArray;
}

- (void)viewDidLoad;

@end
