//
//  CD_KeyChainManager.h
//  cdAnalysis
//
//  Created by sobeycloud on 2018/10/30.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CD_KeyChainManager : NSObject


/**
 获取设备的UUID

 @return UUID
 */
+ (NSString *)getDeviceUUID;

/**
 保存用户密码在钥匙串
 
 @param userId 用户id
 @param pwd 用户密码
 */
+ (void)saveUserInfoWithUserId:(NSString *)userId passWord:(NSString *)pwd;


/**
 根据用户ID获取用户的密码

 @param userId 用户id
 @return 密码
 */
+ (NSString *)getUserIdWithUserId:(NSString *)userId;


/**
 保存数据包钥匙串

 @param data 需要保存的数据
 @param key 保存的键值
 */
+ (void)saveData:(id)data toKeyChain:(NSString *)key;

/**
 加载钥匙串对应key的数据

 @param key 关键字key
 */
+ (id)loadDataWithKey:(NSString *)key;

/**
 加载keychain数据
 
 @return 数据
 */
+ (id)loadDataToKeyChain;

/**
 删除keychain
 */
+ (void)deleteDataToKeyChain;



@end
