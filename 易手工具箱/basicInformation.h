//
//  basicInformation.h
//  易手工具箱
//
//  Created by fungjack on 2017/2/25.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface basicInformation : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *informationArray;
    NSString *modelInfo;
    NSString *systemVersion;
    NSString *cpuInfo;
    NSString *memoryInfo;
    NSString *storageInfo;
    NSString *displayInfo;
    NSString *displayPPI;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
