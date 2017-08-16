//
//  softwareDetail.m
//  易手工具箱
//
//  Created by fungjack on 2017/3/14.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "softwareDetail.h"

@implementation softwareDetail

- (void)viewDidLoad{
    sectionArray = @[@"关于软件", @"给我好评", @"联系作者"];
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [sectionArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifierString = @"JackFung";
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
    if(Cell == nil){
        Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
    }
    Cell.textLabel.text = [sectionArray objectAtIndex:indexPath.row];
    Cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return Cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == 0) {//点击0行
        UIViewController *pushPage = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"aboutSoftware"];
        [self.navigationController pushViewController:pushPage animated:YES];
    }
    else if (indexPath.row == 1){
        NSURL *Address = [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@&pageNumber=0&sortOrdering=2&mt=8", @"1216660644"]];
        [[UIApplication sharedApplication] openURL:Address];
    }
    else if (indexPath.row == 2){
        NSURL *Address = [NSURL URLWithString:@"sms:jackfung1996@icloud.com"];
        [[UIApplication sharedApplication] openURL:Address];
    }
}
@end
