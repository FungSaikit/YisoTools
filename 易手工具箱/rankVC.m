//
//  rankVC.m
//  易手工具箱
//
//  Created by fungjack on 2017/4/10.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "rankVC.h"

@implementation rankVC


#pragma mark - View Controller方法

- (void)viewDidLoad{
    [super viewDidLoad];
    [_activityIndicator setHidesWhenStopped:YES];
    [self readResult];//从文件中读取上一次的结果
    
    _rankChart = [[PNBarChart alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/4+30, SCREEN_WIDTH, self.view.frame.size.height/2)];
    _rankChart.xLabels = @[@"Intel\ni7-4770HQ ", @"iPhone 6S\n(A9 双核)",@"iPhone 6\n(A8 双核)", @"iPhone 5\n(A6 双核)", @"您的设备"];
    _rankChart.yValues = @[@11.20, @19.14, @35.83, @43.27, _chartResult];
    _rankChart.chartMarginTop = 0;
    _rankChart.showChartBorder = YES;
    _rankChart.barWidth = 40;
    _rankChart.showLabel = YES;
    [_rankChart strokeChart];
    [self.view addSubview:_rankChart];
    BmobQuery *bquery = [BmobQuery queryWithClassName:@"RankList"];
    [bquery orderByAscending:@"Score"];//按照成绩排序
    bquery.limit = 20;//返回前20个结果

}

- (void)viewWillAppear:(BOOL)animated{
    [_rankChart strokeChart];
}

#pragma mark - 触摸任意位置textField放弃第一响应者

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_nameText resignFirstResponder];
}

#pragma mark - Button事件

- (IBAction)startButton:(id)sender {
    //准备两个带测试的数组
    for (int i = 0; i<50000; i++) {
        testArray[i] = rand()%10;
    }
    for (int i = 0; i<50000; i++) {
        testArray2[i] = (float)(rand()%100 + 100)/100.0f;
    }
    
    _Score.text = @"正在测试……";
    [_startButton setHidden:YES];
    [_activityIndicator startAnimating];
    [self performSelectorInBackground:@selector(runTest) withObject:nil];//后台线程执行测试
}

- (IBAction)uploadButton:(id)sender {//上传成绩按钮
    [_nameText resignFirstResponder];//隐藏键盘
    if ((![_chartResult isEqualToNumber:@0])&&(![_nameText.text isEqualToString:@""])){//(测试结果不等于0且称呼不等于空)
        BmobObject *scoreObject = [BmobObject objectWithClassName:@"RankList"];
        [scoreObject setObject:[getInformation getModelInfo] forKey:@"Device"];
        [scoreObject setObject:[getInformation getSystemVersion] forKey:@"System"];
        [scoreObject setObject:_nameText.text forKey:@"userid"];
        CGFloat tempFloat = [_chartResult floatValue];
        [scoreObject setObject:[NSNumber numberWithFloat:tempFloat] forKey:@"Score"];
        UIAlertController *uploadAlert = [UIAlertController alertControllerWithTitle:@"上传中" message:@"请稍后……" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:uploadAlert animated:YES completion:nil];
    
        [scoreObject saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
            [uploadAlert setTitle:@"上传结果"];
            [uploadAlert setMessage:@"已完成！"];
            UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"朕知道了" style: UIAlertActionStyleDefault handler:nil];
            [uploadAlert addAction:okButton];
        }];
    }
    else{//如果没有测试结果
        UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"上传失败" message:@"未测试成绩或未填写称呼" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:nil];
        [errorAlert addAction:okButton];
        [self presentViewController:errorAlert animated:YES completion:nil];
    }
}

#pragma mark - 计算方法

- (void)runTest{
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];//禁止在运行跑分时屏幕关闭
    //计算执行时间
    
    NSDate *beginTime = [NSDate date];
    
    //计算步骤开始
    dispatch_async(dispatch_get_main_queue(), ^{
        _Score.text = @"正在进行整数测试";//主线程刷新提示
    });
    bubbleSort(testArray, 50000);
    dispatch_async(dispatch_get_main_queue(), ^{
        _Score.text = @"正在进行浮点测试";//主线程刷新提示
    });
    getPi();
    //计算步骤完成
    
    [[UIApplication sharedApplication] setIdleTimerDisabled:NO];//跑分完成，可以自动关闭屏幕了
    CGFloat deltaTime = [[NSDate date]timeIntervalSinceDate:beginTime];//获取使用时间
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //回调或者说是通知主线程刷新，
        _chartResult = [NSNumber numberWithFloat:deltaTime];
        _Score.text = [NSString stringWithFormat:@"所用时间(越小越好):%.2fs", deltaTime];
        [_startButton setTitle:@"再次测试" forState:UIControlStateNormal];
        [_startButton setHidden:false];
        [_activityIndicator stopAnimating];
        _rankChart.yValues = @[@11.20, @19.14, @35.83, @43.27, _chartResult];
        [_rankChart strokeChart];
        [self saveResult];//数据持久化测试结果
    }); 

    
    
}

- (void)saveResult{//用于保存当前的测试结果
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *fileName = @"/ChartResult.plist";
    NSString *filePath = [documentDirectory stringByAppendingString:fileName];
    NSDictionary *resultDictionary = [NSDictionary dictionaryWithObject:_chartResult forKey:@"result"];
    NSArray *resultArray = @[resultDictionary];
    
    [resultArray writeToFile:filePath atomically:YES];
    
}

- (void)readResult{//用于上次的读取测试结果
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *fileName = @"/ChartResult.plist";
    NSString *filePath = [documentDirectory stringByAppendingString:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath:filePath]){
        NSMutableArray *resultArray = [NSMutableArray arrayWithContentsOfFile:filePath];
        NSDictionary *resultDictionary = [resultArray firstObject];
        _chartResult = [resultDictionary objectForKey:@"result"];
    }
    else{
        _chartResult = @0;
    }
}


#pragma mark - 算法

void bubbleSort(int a[], int n){//冒泡排序算法
    int i, j, tmp;
    for (j = 0; j<n-1; j++) {
        for (i = 0 ; i<n-1-j; i++) {
            if (a[i] > a[i+1]) {
                tmp = a[i];
                a[i] = a[j];
                a[j] = tmp;
            }
        }
    }
}

void getPi(){
    double pi = 2;
    int n = 500000000;
    for (int i = n; i > 0; i--) {
        pi = pi * i / (2 * i + 1) + 2;
    }
}

@end
