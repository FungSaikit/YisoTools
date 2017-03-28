//
//  basicInformation.m
//  易手工具箱
//
//  Created by fungjack on 2017/2/25.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "basicInformation.h"
#import "getInformation.h"

@implementation basicInformation

-(void)viewDidLoad{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];//设置状态栏白色字体

    modelInfo = [getInformation getModelInfo];
    systemVersion = [getInformation getSystemVersion];
    cpuInfo = [getInformation getCpuInfo];
    memoryInfo = [getInformation getMemoryInfo];
    storageInfo = [getInformation getStorageInfo];
    displayInfo = [getInformation getDisplayInfo];
    displayPPI = [getInformation getDisplayPPI];
    informationArray = [NSArray arrayWithObjects:modelInfo, systemVersion, cpuInfo, memoryInfo, storageInfo, displayInfo, displayPPI, nil];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [informationArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"JackFung";
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(Cell == nil){
        Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    Cell.textLabel.text = [informationArray objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        Cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return Cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{//点击单元格事件
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//点击row时不变色
    if(indexPath.row == 0){
        UIViewController *coderDetail = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"searchVC"];
        
        [self.navigationController pushViewController:coderDetail animated:YES];
        
        
    }
}

@end
