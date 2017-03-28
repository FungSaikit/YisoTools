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
//    sectionArray = @[@"纯色检查", @"触摸测试"];
//    detailArray = @[@"检查坏点、阴阳屏等问题(建议关闭Night Shift)", @"测试触摸屏是否正常运行"];
    sectionArray = @[@"纯色检查(建议关闭Night Shift)"];
    detailArray = @[@"请您仔细观察屏幕是否出现坏点、阴阳屏等情况"];
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
    
}

@end
