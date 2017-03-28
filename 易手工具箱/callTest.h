//
//  callTest.h
//  易手工具箱
//
//  Created by fungjack on 2017/2/27.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface callTest : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *phoneTestArray;
    NSArray *detailArray;
}
-(void)viewDidLoad;

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
