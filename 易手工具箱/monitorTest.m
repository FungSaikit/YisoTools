//
//  monitorTest.m
//  易手工具箱
//
//  Created by fungjack on 2017/3/14.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "monitorTest.h"

@implementation monitorTest

- (void)viewDidLoad{
    sectionArray = @[@"纯色检查(建议关闭Night Shift)", @"触摸测试(从左侧边界右滑返回)", @"多点触摸测试"];
    detailArray = @[@"请您观察屏幕在纯色下是否令您满意", @"程序每0.1秒将你触摸过的点变为黑色小块", @"获取屏幕所支持的最大触摸点数"];
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [sectionArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *defaultWord = @"JackFung";
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:defaultWord];
    if (Cell == nil) {
        Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:defaultWord];
    }
    Cell.textLabel.text = [sectionArray objectAtIndex:indexPath.row];
    Cell.detailTextLabel.text = [detailArray objectAtIndex:indexPath.row];
    Cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return Cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];//选择row时不显示点击的选项
    if(indexPath.row == 0){
        UIViewController *coderDetail = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ColorTestVC"];
        [self.navigationController pushViewController:coderDetail animated:YES];
    }
    else if (indexPath.row == 1){
        UIViewController *coderDetail = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TouchTestVC"];
        [self.navigationController pushViewController:coderDetail animated:YES];
    }
    else if (indexPath.row == 2){
        UIViewController *coderDetail = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MultiTouchTestVC"];
        [self.navigationController pushViewController:coderDetail animated:YES];
    }
    
}

@end
