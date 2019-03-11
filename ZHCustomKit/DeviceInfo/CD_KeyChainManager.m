//
//  CD_KeyChainManager.m
//  cdAnalysis
//
//  Created by sobeycloud on 2018/10/30.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import "CD_KeyChainManager.h"

#warning 根据不同的项目（或者不同的账号采用不同的id，保证具有独性）
static NSString *const deviceUUID = @"com.sobeycloud.cdAnalysis.uuid";
static NSString *const keychainServerKey = @"com.sobeycloud.cdAnalysis";


@implementation CD_KeyChainManager


/// 获取设备的UUID
+ (NSString *)getDeviceUUID {
    
    NSDictionary *dict = [CD_KeyChainManager loadDataToKeyChain];
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithDictionary:dict];
    NSString *uuid;
    
    if (mdict && [mdict objectForKey:deviceUUID]) {
        
        uuid = mdict[deviceUUID];
        
    } else {
        
        uuid = [NSUUID UUID].UUIDString;
        [mdict setObject:uuid forKey:deviceUUID];
        [CD_KeyChainManager saveDataToKeyChain:mdict];
        
    }
    
    return uuid;
    
}

/// 保存用户密码在钥匙串
+ (void)saveUserInfoWithUserId:(NSString *)userId passWord:(NSString *)pwd {
    
    NSDictionary *dict = [CD_KeyChainManager loadDataToKeyChain];
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithDictionary:dict];
    [mdict setObject:pwd forKey:userId];
    
    [CD_KeyChainManager saveDataToKeyChain:mdict];
}


/// 根据用户ID获取用户的密码
+ (NSString *)getUserIdWithUserId:(NSString *)userId {
    
    NSDictionary *mdict = [CD_KeyChainManager loadDataToKeyChain];
    if ([mdict objectForKey:userId]) {
        return mdict[userId];
    }
    
    return nil;
    
}

/// 保存数据包钥匙串
+ (void)saveData:(id)data toKeyChain:(NSString *)key {
    
    NSDictionary *dict = [CD_KeyChainManager loadDataToKeyChain];
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithDictionary:dict];
    [mdict setObject:data forKey:key];
    
    [CD_KeyChainManager saveDataToKeyChain:mdict];
}

/// 加载钥匙串对应key的数据
+ (id)loadDataWithKey:(NSString *)key {
    
    NSDictionary *mdict = [CD_KeyChainManager loadDataToKeyChain];
    if ([mdict objectForKey:key]) {
        return mdict[key];
    }
    
    return nil;
    
}



#pragma mark ---- 获取存储的KeyChain
+ (NSMutableDictionary *)getKeychainQuery {
    
    NSString *service = keychainServerKey;
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithObjectsAndKeys:(id)kSecClassGenericPassword,(id)kSecClass, service, (id)kSecAttrService, service, (id)kSecAttrAccount, (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible, nil];
    
    return mdict;
}

#pragma mark 写入
+ (void)saveDataToKeyChain:(NSDictionary *)data {
    
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [CD_KeyChainManager getKeychainQuery];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

#pragma mark 读取
+ (id)loadDataToKeyChain {
    
    id ret = nil;
    NSMutableDictionary *keychainQuery = [CD_KeyChainManager getKeychainQuery];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", keychainServerKey, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

#pragma mark 删除
+ (void)deleteDataToKeyChain {
    
    NSMutableDictionary *keychainQuery = [CD_KeyChainManager getKeychainQuery];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}








#pragma mark ------------ keyChain

-(BOOL)addItemWithService:(NSString *)service account:(NSString *)account password:(NSString *)password{
    //先查查是否已经存在
    //构造一个操作字典用于查询
    
    NSMutableDictionary *queryDic = [NSMutableDictionary dictionary];
    
//    [queryDic setObject:@"" forKey:kSecAttrAccessGroup];
    [queryDic setObject:service forKey:(__bridge id)kSecAttrService];                         //标签service
    [queryDic setObject:account forKey:(__bridge id)kSecAttrAccount];                         //标签account
    [queryDic setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];//表明存储的是一个密码
    
    OSStatus status = -1;
    CFTypeRef result = NULL;
    
    status = SecItemCopyMatching((__bridge CFDictionaryRef)queryDic, &result);
    
    if (status == errSecItemNotFound) {                                              //没有找到则添加
        
        NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];    //把password 转换为 NSData
        
        [queryDic setObject:passwordData forKey:(__bridge id)kSecValueData];       //添加密码
        
        status = SecItemAdd((__bridge CFDictionaryRef)queryDic, NULL);             //!!!!!关键的添加API
        
    }else if (status == errSecSuccess){                                              //成功找到，说明钥匙已经存在则进行更新
        
        NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];    //把password 转换为 NSData
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:queryDic];
        
        [dict setObject:passwordData forKey:(__bridge id)kSecValueData];             //添加密码
        
        status = SecItemUpdate((__bridge CFDictionaryRef)queryDic, (__bridge CFDictionaryRef)dict);//!!!!关键的更新API
        
    }
    
    return (status == errSecSuccess);
}


- (NSString *)passwordForService:(nonnull NSString *)service account:(nonnull NSString *)account{
    
    //生成一个查询用的 可变字典
    NSMutableDictionary *queryDic = [NSMutableDictionary dictionary];
    
    //首先添加获取密码所需的搜索键和类属性：
    [queryDic setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass]; //表明为一般密码可能是证书或者其他东西
    [queryDic setObject:(__bridge id)kCFBooleanTrue  forKey:(__bridge id)kSecReturnData];     //返回Data
    
    [queryDic setObject:service forKey:(__bridge id)kSecAttrService];    //输入service
    [queryDic setObject:account forKey:(__bridge id)kSecAttrAccount];  //输入account
    
    //查询
    OSStatus status = -1;
    CFTypeRef result = NULL;
    status = SecItemCopyMatching((__bridge CFDictionaryRef)queryDic,&result);//核心API 查找是否匹配 和返回密码！
    if (status != errSecSuccess) { //判断状态
        
        return nil;
    }
    //返回数据
    //    NSString *password = [[NSString alloc] initWithData:(__bridge_transfer NSData *)result encoding:NSUTF8StringEncoding];//转换成string
    
    //删除kSecReturnData键; 我们不需要它了：
    [queryDic removeObjectForKey:(__bridge id)kSecReturnData];
    //将密码转换为NSString并将其添加到返回字典：
    NSString *password = [[NSString alloc] initWithBytes:[(__bridge_transfer NSData *)result bytes] length:[(__bridge NSData *)result length] encoding:NSUTF8StringEncoding];
    
    [queryDic setObject:password forKey:(__bridge id)kSecValueData];
    
//    NSLog(@"查询 : %@", queryDic);
    
    return password;
}


-(BOOL)deleteItemWithService:(NSString *)service account:(NSString *)account{
    
    NSMutableDictionary *queryDic = [NSMutableDictionary dictionary];
    
    [queryDic setObject:service forKey:(__bridge id)kSecAttrService];                         //标签service
    [queryDic setObject:account forKey:(__bridge id)kSecAttrAccount];                         //标签account
    [queryDic setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];//表明存储的是一个密码
    
    
    OSStatus status = SecItemDelete((CFDictionaryRef)queryDic);
    
    return (status == errSecSuccess);
}




@end
