//
//  topRank.m
//  易手工具箱
//
//  Created by fungjack on 2017/5/6.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "topRank.h"


@implementation topRank

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [_loadingIndicator startAnimating];
    [_loadingIndicator hidesWhenStopped];

    
    BmobQuery *top10Rank = [BmobQuery queryWithClassName:@"RankList"];
    top10Rank.limit = 10;//限制获取10条
    [top10Rank orderByAscending:@"Score"];//按照成绩排序
    [top10Rank findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        [_loadingIndicator stopAnimating];
        [_loadingLabel setHidden:YES];
        NSMutableArray *rankName = [[NSMutableArray alloc] init];
        NSMutableArray *rankNumber = [[NSMutableArray alloc] init];
        for (BmobObject *obj in array) {
            [rankName addObject:[NSString stringWithFormat:@"%@的%@", [obj objectForKey:@"userid"], [obj objectForKey:@"Device"]]];
            [rankNumber addObject:[obj objectForKey:@"Score"]];
            
            NSLog(@"userid = %@", [obj objectForKey:@"userid"]);
            NSLog(@"device = %@", [obj objectForKey:@"Device"]);
            NSLog(@"Score = %@", [obj objectForKey:@"Score"]);
        }
        
        NSLog(@"%@", rankName);
        NSLog(@"%@", rankNumber);
        
        
        JXBarChartView *rankChart = [[JXBarChartView alloc] initWithFrame:CGRectMake(0, (self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height ), self.view.frame.size.width, self.view.frame.size.width) startPoint:CGPointMake(5, 5) values:rankNumber maxValue:[[rankNumber lastObject] floatValue] textIndicators:rankName textColor:[UIColor grayColor] barHeight:20 barMaxWidth:self.view.frame.size.width-110 gradient:nil];
        
        [self.view addSubview:rankChart];
    }];


    
    
}


@end
