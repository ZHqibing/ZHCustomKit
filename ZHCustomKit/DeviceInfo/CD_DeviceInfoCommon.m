//
//  CD_DeviceInfoManager.m
//  cdAnalysis
//
//  Created by sobeycloud on 2018/10/24.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import "CD_DeviceInfoCommon.h"
#import <UIKit/UIKit.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CommonCrypto/CommonDigest.h>
#import <objc/runtime.h>
#import <sys/utsname.h>
#import "CD_KeyChainManager.h"

#define cd_ScreenWidth [UIScreen mainScreen].bounds.size.width
#define cd_ScreenHeight [UIScreen mainScreen].bounds.size.height
#define cd_ScreenScale [UIScreen mainScreen].scale

static NSString *const keyKeychainKey = @"com.sobeycloud.cdAnalysis";


@implementation CD_DeviceInfoCommon

/** 获取app名字 */
+ (NSString *)getBundleNameString {
    
    NSString *displayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    if (displayName.length < 1) {
        displayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
    }
    
    return displayName;
}

/** 获取app版本号 */
+ (NSString *)getBundleShortVersionString {
    
    NSString *shortString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    return shortString;
}

/** 获取app版本编译号 */
+ (NSString *)getBundleVersionString {
    
    NSString *buildString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
    return buildString;
}

/** 获取应用程序ID */
+ (NSString *)getBundleIdString {
    
    NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
    
    return bundleId;
}


/** 获取设备ID */
+ (NSString *)getDeviceId {
    
    NSString *uuidstring = [CD_KeyChainManager getDeviceUUID];
    
    return uuidstring;
}

/** 获取操作系统 */
+ (NSString *)getSystemString {
    
    NSString *system = @"iOS";
    
    return system;
}

/** 获取操作系统版本号 */
+ (NSString *)getSystemVersion {
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    
    return version;
}

/** 获取系统设备名字 */
+ (NSString *)getDeviceNameString {
    
    NSString *name = [[UIDevice currentDevice] systemName];
    
    return name;
}

/** 获取系统语言 */
+ (NSString *)getContentLanguage {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    NSString *currentLanguage = [languages objectAtIndex:0];
    
    return currentLanguage;
}

/** 获取屏幕分辨率 */
+ (NSString *)getDisplayString {
    
    CGFloat displayWidth = cd_ScreenScale * cd_ScreenWidth;
    CGFloat displayHeight = cd_ScreenScale * cd_ScreenHeight;
    
    NSString *display = [NSString stringWithFormat:@"%.fx%.f",displayWidth,displayHeight];
    
    return display;
}

/** 获取屏幕密度 */
+ (NSString *)getDensityString {
    
    NSString *density = [NSString stringWithFormat:@"%.f",cd_ScreenScale];
    
    return density;
}

/** 获取wifi物理地址 */
+ (NSString *)getWiFiMacStr {
    
    NSString *ssid = @"Not Found";
    NSString *macIp = @"";
    CFArrayRef myArray =CNCopySupportedInterfaces();
    if (myArray != nil) {
        CFDictionaryRef myDict =CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray,0));
        if (myDict != nil) {
            NSDictionary *dict = (NSDictionary*)CFBridgingRelease(myDict);
            ssid = [dict valueForKey:@"SSID"];           //WiFi名称
            macIp = [dict valueForKey:@"BSSID"];     //Mac地址
        }
    }
    
    return macIp;
}

/** 当前网络类型（wifi、wlan、其他） */
+ (NSString *)getNewWorkType {
    
    UIApplication *app = [UIApplication sharedApplication];
    
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    int type = 0;
    for (id child in children) {
        if ([child isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    
    NSString *stateString = @"wifi";
    
    switch (type) {
        case 0:
            stateString = @"notReachable";
            break;
            
        case 1:
            stateString = @"2G";
            break;
            
        case 2:
            stateString = @"3G";
            break;
            
        case 3:
            stateString = @"4G";
            break;
            
        case 4:
            stateString = @"LTE";
            break;
            
        case 5:
            stateString = @"wifi";
            break;
            
        default:
            break;
    }
    
    return stateString;
}

/** 运营商类型（移动、电信、联通） */
+ (NSString *)getNetPhoneType {
    
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = networkInfo.subscriberCellularProvider;
    NSString *carrier_name = @"未知"; //网络运营商的名字 
    NSString *code = [carrier mobileNetworkCode];
    
    if ([code isEqualToString:@"00"] || [code isEqualToString:@"02"] || [code isEqualToString:@"07"]) {
        //移动 CMCC
        carrier_name = @"移动";
    }
    
    if ([code isEqualToString:@"03"] || [code isEqualToString:@"05"]) {
        // ret = @"电信"; CTCC
        carrier_name = @"电信";
    }
    
    if ([code isEqualToString:@"01"] || [code isEqualToString:@"06"]) {
        // ret = @"联通"; CUCC
        carrier_name = @"联通";
    }
    
    return carrier_name;
}

/** wifi是否可用 */
+ (BOOL)getNetworkWifiStatus {
    
    return YES;
}

/** 蓝牙是否可用 */
+ (BOOL)getBTStatus {
    
    return YES;
}

/** 重力感应是否可用 */
+ (BOOL)getGravityStatus {
    
    return YES;
}




#pragma mark ---

+ (long)getTimeLong {
    
    long time = (long)([[NSDate date] timeIntervalSince1970] * 1000);
    return time;
}

+ (NSString *)getMccmncString {
    
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = networkInfo.subscriberCellularProvider;
    
    NSString *carrier_country_code = carrier.isoCountryCode;
    
    if (carrier_country_code == nil) {
        
        carrier_country_code = @"";
        
    }
    
    //国家编号
    
    NSString *CountryCode = carrier.mobileCountryCode;
    
    if (CountryCode == nil) {
        
        CountryCode = @"";
        
    }
    
    NSLog(@"国家编号 = %@",CountryCode);
    
    //网络供应商编码
    NSString *NetworkCode = carrier.mobileNetworkCode;
    
    if (NetworkCode == nil)
        
    {
        NetworkCode = @"";
        
    }
    
    NSLog(@"网络供应商编码 = %@",NetworkCode);
    
    NSString *mobile_country_code = [NSString stringWithFormat:@"%@%@",CountryCode,NetworkCode];
    
    if (mobile_country_code == nil)
        
    {
        mobile_country_code = @"";
        
    }
    
    
    return mobile_country_code;
    
}






/** 获取手机型号
    相关地址 ： https://www.theiphonewiki.com/wiki/Models
 
 */
+ (NSString *)getIphoneType {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    ////// iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    
    if ([platform isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    
    if ([platform isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    
    if ([platform isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    
    /// if ([platform isEqualToString:@""]) return @"";
    
    
    
    //// iPod
    if ([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch 1";
    
    if ([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2";
    
    if ([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3";
    
    if ([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4";
    
    if ([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5";
    
    if ([platform isEqualToString:@"iPod7,1"]) return @"iPod touch 6";
    
    /// if ([platform isEqualToString:@""]) return @"";
    
    
    
    //// iPad
    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad";
    
    if ([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"]) return @"iPad mini";
    
    if ([platform isEqualToString:@"iPad2,6"]) return @"iPad mini";
    
    if ([platform isEqualToString:@"iPad2,7"]) return @"iPad mini";
    
    if ([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"]) return @"iPad mini 2";
    
    if ([platform isEqualToString:@"iPad4,5"]) return @"iPad mini 2";
    
    if ([platform isEqualToString:@"iPad4,6"]) return @"iPad mini 2";
    
    if ([platform isEqualToString:@"iPad4,7"]) return @"iPad mini 3";
    
    if ([platform isEqualToString:@"iPad4,8"]) return @"iPad mini 3";
    
    if ([platform isEqualToString:@"iPad4,9"]) return @"iPad mini 3";
    
    if ([platform isEqualToString:@"iPad5,1"]) return @"iPad mini 4";
    
    if ([platform isEqualToString:@"iPad5,2"]) return @"iPad mini 4";
    
    if ([platform isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    
    if ([platform isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    
    if ([platform isEqualToString:@"iPad6,3"]) return @"iPad Pro (9.7-inch)";
    
    if ([platform isEqualToString:@"iPad6,4"]) return @"iPad Pro (9.7-inch)";
    
    if ([platform isEqualToString:@"iPad6,7"]) return @"iPad Pro (12.9-inch)";
    
    if ([platform isEqualToString:@"iPad6,8"]) return @"iPad Pro (12.9-inch)";
    
    if ([platform isEqualToString:@"iPad6,11"]) return @"iPad 5";
    
    if ([platform isEqualToString:@"iPad6,12"]) return @"iPad 5";
    
    if ([platform isEqualToString:@"iPad7,1"]) return @"iPad Pro (12.9-inch, 2nd generation)";
    
    if ([platform isEqualToString:@"iPad7,2"]) return @"iPad Pro (12.9-inch, 2nd generation)";
    
    if ([platform isEqualToString:@"iPad7,3"]) return @"iPad Pro (10.5-inch)";
    
    if ([platform isEqualToString:@"iPad7,4"]) return @"iPad Pro (10.5-inch)";
    
    if ([platform isEqualToString:@"iPad7,5"]) return @"iPad 6";
    
    if ([platform isEqualToString:@"iPad7,6"]) return @"iPad 6";
    
    /// if ([platform isEqualToString:@""]) return @"";
    
    
    
    //// iWatch
    if ([platform isEqualToString:@"Watch1,1"]) return @"Apple Watch";
    
    if ([platform isEqualToString:@"Watch1,2"]) return @"Apple Watch";
    
    if ([platform isEqualToString:@"Watch2,6"]) return @"Apple Watch Series 1";
    
    if ([platform isEqualToString:@"Watch2,7"]) return @"Apple Watch Series 1";
    
    if ([platform isEqualToString:@"Watch2,3"]) return @"Apple Watch Series 2";
    
    if ([platform isEqualToString:@"Watch2,4"]) return @"Apple Watch Series 2";
    
    if ([platform isEqualToString:@"Watch3,1"]) return @"Apple Watch Series 3";
    
    if ([platform isEqualToString:@"Watch3,2"]) return @"Apple Watch Series 3";
    
    if ([platform isEqualToString:@"Watch3,3"]) return @"Apple Watch Series 3";
    
    if ([platform isEqualToString:@"Watch3,4"]) return @"Apple Watch Series 3";
    
    if ([platform isEqualToString:@"Watch4,1"]) return @"Apple Watch Series 4";
    
    if ([platform isEqualToString:@"Watch4,2"]) return @"Apple Watch Series 4";
    
    if ([platform isEqualToString:@"Watch4,3"]) return @"Apple Watch Series 4";
    
    if ([platform isEqualToString:@"Watch4,4"]) return @"Apple Watch Series 4";
    //// if ([platform isEqualToString:@""]) return @"";
    
    
    if ([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    return platform;
    
}



@end




