//
//  callTest.m
//  易手工具箱
//
//  Created by fungjack on 2017/2/27.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "callTest.h"

@implementation callTest

-(void)viewDidLoad{
    [super viewDidLoad];
    phoneTestArray = [NSArray arrayWithObjects:@"测试听筒1", @"测试听筒2", @"测试听筒3", @"话筒及扬声器测试", nil];
    detailArray = [NSArray arrayWithObjects:@"移动用户请点击此处", @"联通用户请点击此处", @"电信用户请点击此处", @"请使用录音测试话筒及扬声器是否可用", nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [phoneTestArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *defaultWord = @"JackFung";
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:defaultWord];
    if(tableViewCell == nil){
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:defaultWord];
    }
    
    tableViewCell.textLabel.text = [phoneTestArray objectAtIndex:indexPath.row];
    tableViewCell.detailTextLabel.text = [detailArray objectAtIndex:indexPath.row];
    tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return tableViewCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];//点击row时不变色
    if (indexPath.row == 0) {
        NSMutableString * str=[[NSMutableString alloc] initWithString:@"tel:10086"];
        UIWebView * callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.view addSubview:callWebview];
    }
    else if(indexPath.row == 1){
        NSMutableString * str=[[NSMutableString alloc] initWithString:@"tel:10010"];
        UIWebView *callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.view addSubview:callWebview];
    }
    else if(indexPath.row == 2){
        NSMutableString * str=[[NSMutableString alloc] initWithString:@"tel:10000"];
        UIWebView *callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.view addSubview:callWebview];
    }
    else if(indexPath.row == 3){
        UIViewController *pushPage = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"recorderView"];
        [self.navigationController pushViewController:pushPage animated:YES];
    }
    
    
}


@end
