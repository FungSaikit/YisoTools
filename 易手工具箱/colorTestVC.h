//
//  colorTestVC.h
//  易手工具箱
//
//  Created by fungjack on 2017/3/16.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface colorTestVC : UIViewController

@property NSInteger pageIndex;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
- (IBAction)tapToChange:(id)sender;

@end
