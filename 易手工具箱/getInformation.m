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
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"  iPhone_1G";
    else if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone_3G";
    else if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone_3GS";
    else if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone_4";
    else if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon_iPhone_4";
    else if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone_4S";
    else if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone_5";
    else if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone_5";
    else if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone_5C";
    else if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone_5C";
    else if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone_5S";
    else if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone_5S";
    else if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone_6_Plus";
    else if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone_6";
    else if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone_6s";
    else if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone_6s_Plus";
    else if([deviceString isEqualToString:@"iPhone8,3"] || [deviceString isEqualToString:@"iPhone8,4"])   return @"iPhone_SE";
    else if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone_7";
    else if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone_7_Plus";
    else return [NSString stringWithFormat:@"%@", deviceString];
}

+(NSString *)getTimeToMarket{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"2007年1月9日";
    else if ([deviceString isEqualToString:@"iPhone1,2"])    return @"2008年6月9日";
    else if ([deviceString isEqualToString:@"iPhone2,1"])    return @"2009年6月8日";
    else if ([deviceString isEqualToString:@"iPhone3,1"])    return @"2010年6月7日";
    else if ([deviceString isEqualToString:@"iPhone3,2"])    return @"2010年6月7日";
    else if ([deviceString isEqualToString:@"iPhone4,1"])    return @"2011年10月4日";
    else if ([deviceString isEqualToString:@"iPhone5,1"])    return @"2012年9月12日";
    else if ([deviceString isEqualToString:@"iPhone5,2"])    return @"2012年9月12日";
    else if ([deviceString isEqualToString:@"iPhone5,3"])    return @"2013年9月10日";
    else if ([deviceString isEqualToString:@"iPhone5,4"])    return @"2013年9月10日";
    else if ([deviceString isEqualToString:@"iPhone6,1"])    return @"2013年9月10日";
    else if ([deviceString isEqualToString:@"iPhone6,2"])    return @"2013年9月10日";
    else if ([deviceString isEqualToString:@"iPhone7,1"])    return @"2014年9月9日";
    else if ([deviceString isEqualToString:@"iPhone7,2"])    return @"2014年9月9日";
    else if ([deviceString isEqualToString:@"iPhone8,1"])    return @"2015年9月9日";
    else if ([deviceString isEqualToString:@"iPhone8,2"])    return @"2015年9月9日";
    else if([deviceString isEqualToString:@"iPhone8,3"] || [deviceString isEqualToString:@"iPhone8,4"])   return @"2016年3月21日";
    else if ([deviceString isEqualToString:@"iPhone9,1"])    return @"2016年9月8日";
    else if ([deviceString isEqualToString:@"iPhone9,2"])    return @"2016年9月8日";
    else return [NSString stringWithFormat:@"未知"];
}

+(NSString *)getSystemVersion{
    NSString *systemVersion = [NSString stringWithFormat:@"iOS %@", [[UIDevice currentDevice] systemVersion]];
    return systemVersion;
}

+(NSString *)getCpuInfo{//需修改准确型号
    
    //获取CPU个数
    unsigned int ncpu;
    size_t len = sizeof(ncpu);
    sysctlbyname("hw.ncpu", &ncpu, &len, NULL, 0);
    
    //获取CPU类型
    host_basic_info_data_t hostInfo;
    mach_msg_type_number_t infoCount;
    infoCount = HOST_BASIC_INFO_COUNT;
    host_info(mach_host_self(), HOST_BASIC_INFO, (host_info_t)&hostInfo, &infoCount);
    NSString *cpuType;
    switch (hostInfo.cpu_type) {
        case CPU_TYPE_ARM:
            cpuType = @"ARM 32位";
            break;
            
        case CPU_TYPE_ARM64:
            cpuType = @"ARM 64位";
            break;
            
        case CPU_TYPE_X86:
            cpuType = @"X86";
            break;
            
        case CPU_TYPE_X86_64:
            cpuType = @"X64";
            break;
            
        default:
            cpuType = @"未知";
            break;
    }
    
    return [NSString stringWithFormat:@"%d 个 %@ 核心", ncpu, cpuType];
}

+(NSString *)getMemoryInfo{
    NSInteger totalMemory = (NSInteger)[NSProcessInfo processInfo].physicalMemory;
    return [NSString stringWithFormat:@"%ld MB", (long)totalMemory/1024/1024];
}

+(NSString *)getStorageInfo{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *fat = [fm attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSString *StorageString = [NSString stringWithFormat:@"%.1f GB / %.1f GB", [[fat objectForKey:NSFileSystemFreeSize]floatValue]/1000000000,[[fat objectForKey:NSFileSystemSize] floatValue]/1000000000];
    return StorageString;
}

+(NSString *)getDisplayInfo{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    return [NSString stringWithFormat:@"%.0f*%.0f", width*scale_screen ,height*scale_screen];


}

+(NSString *)getDisplayPPI{
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    NSString *displayPPI;
    
    if(scale_screen == 2){
        displayPPI = @"326PPI";
    }
    else if(scale_screen == 1){
        displayPPI = @"163PPI";
    }
    else if(scale_screen == 3){
        displayPPI = @"401PPI";
    }
    else{
        displayPPI = [NSString stringWithFormat:@"放大倍数为X%lf的设备,未知ppi", scale_screen];
    }
    
    return displayPPI;
}

+ (NSString *)getPhoneName{
    return [[UIDevice currentDevice] name];
}

@end
