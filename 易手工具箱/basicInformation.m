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
    timeToMarket = [getInformation getTimeToMarket];
    phoneName = [getInformation getPhoneName];
    systemVersion = [getInformation getSystemVersion];
    cpuInfo = [getInformation getCpuInfo];
    memoryInfo = [getInformation getMemoryInfo];
    storageInfo = [getInformation getStorageInfo];
    displayInfo = [getInformation getDisplayInfo];
    displayPPI = [getInformation getDisplayPPI];
    informationArray = [NSArray arrayWithObjects:modelInfo, timeToMarket, phoneName, systemVersion, cpuInfo, memoryInfo, storageInfo, displayInfo, displayPPI, nil];
    titleArray = @[@"本机型号", @"上市时间", @"本机名称", @"系统版本", @"CPU信息", @"运行内存", @"存储空间(已用/总共)", @"显示分辨率", @"屏幕像素密度"];

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
        Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    
    Cell.textLabel.text = [titleArray objectAtIndex:indexPath.row];
    Cell.detailTextLabel.text = [informationArray objectAtIndex:indexPath.row];
    Cell.textLabel.font = [UIFont systemFontOfSize:18];//设置字体大小
    Cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
    Cell.detailTextLabel.textColor = [UIColor grayColor];
    
    
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

//一下两个方法为延长cell分割线的方法
-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


@end
