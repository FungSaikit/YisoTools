//
//  getInformation.m
//  易手工具箱
//
//  Created by fungjack on 2017/2/26.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "getInformation.h"


@implementation getInformation

+(NSString *)getModelInfo{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"型号：  iPhone_1G";
    else if ([deviceString isEqualToString:@"iPhone1,2"])    return @"型号：  iPhone_3G";
    else if ([deviceString isEqualToString:@"iPhone2,1"])    return @"型号：  iPhone_3GS";
    else if ([deviceString isEqualToString:@"iPhone3,1"])    return @"型号：  iPhone_4";
    else if ([deviceString isEqualToString:@"iPhone3,2"])    return @"型号：  Verizon_iPhone_4";
    else if ([deviceString isEqualToString:@"iPhone4,1"])    return @"型号：  iPhone_4S";
    else if ([deviceString isEqualToString:@"iPhone5,1"])    return @"型号：  iPhone_5";
    else if ([deviceString isEqualToString:@"iPhone5,2"])    return @"型号：  iPhone_5";
    else if ([deviceString isEqualToString:@"iPhone5,3"])    return @"型号：  iPhone_5C";
    else if ([deviceString isEqualToString:@"iPhone5,4"])    return @"型号：  iPhone_5C";
    else if ([deviceString isEqualToString:@"iPhone6,1"])    return @"型号：  iPhone_5S";
    else if ([deviceString isEqualToString:@"iPhone6,2"])    return @"型号：  iPhone_5S";
    else if ([deviceString isEqualToString:@"iPhone7,1"])    return @"型号：  iPhone_6_Plus";
    else if ([deviceString isEqualToString:@"iPhone7,2"])    return @"型号：  iPhone_6";
    else if ([deviceString isEqualToString:@"iPhone8,1"])    return @"型号：  iPhone_6s";
    else if ([deviceString isEqualToString:@"iPhone8,2"])    return @"型号：  iPhone_6s_Plus";
    else if ([deviceString isEqualToString:@"iPhone9,1"])    return @"型号：  iPhone_7";
    else if ([deviceString isEqualToString:@"iPhone9,2"])    return @"型号：  iPhone_7_Plus";
    else return [NSString stringWithFormat:@"型号：  %@", deviceString];
}

+(NSString *)getSystemVersion{
    NSString *systemVersion = [NSString stringWithFormat:@"系统：  iOS %@", [[UIDevice currentDevice] systemVersion]];
    return systemVersion;
}

+(NSString *)getCpuInfo{//需修改准确型号
    NSString *cpuInfo = [NSString stringWithFormat:@"%@", [UIDevice currentDevice]];
    return [NSString stringWithFormat:@"CPU:  %@", cpuInfo];
}

+(NSString *)getMemoryInfo{
    NSInteger totalMemory = (NSInteger)[NSProcessInfo processInfo].physicalMemory;
    return [NSString stringWithFormat:@"内存(总共):  %ld MB", (long)totalMemory/1024/1024];
}

+(NSString *)getStorageInfo{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *fat = [fm attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSString *StorageString = [NSString stringWithFormat:@"存储(可用/总共):  %.1f GB / %.1f GB", [[fat objectForKey:NSFileSystemFreeSize]floatValue]/1000000000,[[fat objectForKey:NSFileSystemSize] floatValue]/1000000000];
    return StorageString;
}

+(NSString *)getDisplayInfo{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    NSString *displayInfo = [NSString stringWithFormat:@"屏幕分辨率:  %.0f*%.0f", width*scale_screen ,height*scale_screen];
    return displayInfo;
}

+(NSString *)getDisplayPPI{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    NSString *displayPPI;
    
    if(width*scale_screen == 750){
        displayPPI = @"像素密度:  326PPI";
    }
    else if(width*scale_screen == 640){
        displayPPI = @"像素密度:  326PPI";
    }
    else if(width*scale_screen == 320){
        displayPPI = @"像素密度:  163PPI";
    }
    else if(width*scale_screen == 1080){
        displayPPI = @"像素密度:  401PPI";
    }
    else{
        displayPPI = @"像素密度:  未知";
    }
    
    return displayPPI;
}




@end
