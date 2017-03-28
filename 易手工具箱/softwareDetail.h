//
//  softwareDetail.h
//  易手工具箱
//
//  Created by fungjack on 2017/3/14.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface softwareDetail : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSArray *sectionArray;
}

- (void)viewDidLoad;

@end
