//
//  CD_DeviceInfoManager.h
//  cdAnalysis
//
//  Created by sobeycloud on 2018/10/24.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>

//// 设备信息获取
@interface CD_DeviceInfoCommon : NSObject


#pragma mark --- 基本信息

/** 获取app名字 */
+ (NSString *)getBundleNameString;

/** 获取app版本号 */
+ (NSString *)getBundleShortVersionString;

/** 获取app版本编译号 */
+ (NSString *)getBundleVersionString;

/** 获取应用程序ID */
+ (NSString *)getBundleIdString;


/** 获取设备ID (UUID) */
+ (NSString *)getDeviceId;

/** 获取操作系统 */
+ (NSString *)getSystemString;

/** 获取操作系统版本号 */
+ (NSString *)getSystemVersion;


/** 获取设备型号 */
+ (NSString *)getIphoneType;

/** 获取系统设备名字 */
+ (NSString *)getDeviceNameString;

/** 获取系统语言 */
+ (NSString *)getContentLanguage;

/** 获取屏幕分辨率 */
+ (NSString *)getDisplayString;

/** 获取屏幕密度 */
+ (NSString *)getDensityString;

/** 获取wifi物理地址 */
+ (NSString *)getWiFiMacStr;

/** 当前网络类型（wifi、wlan、其他） */
+ (NSString *)getNewWorkType;

/** 运营商类型（移动、电信、联通） */
+ (NSString *)getNetPhoneType;



/** wifi是否可用 */
+ (BOOL)getNetworkWifiStatus;

/** 蓝牙是否可用 */
+ (BOOL)getBTStatus;

/** 重力感应是否可用 */
+ (BOOL)getGravityStatus;



/** 获取时间信息 13位时间戳 */
+ (long)getTimeLong;
 
/** 获取移动国家编码和网络编码 */
+ (NSString *)getMccmncString;



@end



