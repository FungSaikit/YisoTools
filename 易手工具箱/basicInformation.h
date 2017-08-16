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
    NSArray *titleArray;
    NSString *modelInfo;
    NSString *timeToMarket;
    NSString *phoneName;
    NSString *systemVersion;
    NSString *cpuInfo;
    NSString *memoryInfo;
    NSString *storageInfo;
    NSString *displayInfo;
    NSString *displayPPI;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
