//
//  getInformation.h
//  易手工具箱
//
//  Created by fungjack on 2017/2/26.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/utsname.h>
#import <UIKit/UIKit.h>
#import <math.h>
#import <sys/param.h>
#import <sys/mount.h>

@interface getInformation : NSObject


+(NSString *)getModelInfo;
+(NSString *)getSystemVersion;
+(NSString *)getCpuInfo;
+(NSString *)getMemoryInfo;
+(NSString *)getStorageInfo;
+(NSString *)getDisplayInfo;
+(NSString *)getDisplayPPI;

@end
