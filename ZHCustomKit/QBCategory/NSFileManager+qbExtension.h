//
//  NSFileManager+qbExtension.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/12.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (qbExtension)

/** 获取 documents 目录：保存应用程序的重要数据文件和用户数据文件等。用户数据基本上都放在这个位置(例如从网上下载的图片或音乐文件)，该文件夹在应用程序更新时会自动备份，在连接iTunes时也可以自动同步备份其中的数据 */
+ (NSString *)qb_getDocumentsDirectorie;

/** 获取 Library 目录： 这个目录下有两个子目录,可创建子文件夹。可以用来放置您希望被备份但不希望被用户看到的数据。该路径下的文件夹，除Caches以外，都会被iTunes备份. */
+ (NSString *)qb_getLibraryDirectorie;

/** 获取 Library/Caches 目录: 保存应用程序使用时产生的支持文件和缓存文件(保存应用程序再次启动过程中需要的信息)，还有日志文件最好也放在这个目录。iTunes 同步时不会备份该目录并且可能被其他工具清理掉其中的数据。 */
+ (NSString *)qb_getCachesDirectorie;

/** 获取 Library/Preferences 目录: 保存应用程序的偏好设置文件。NSUserDefaults类创建的数据和plist文件都放在这里。会被iTunes备份。 */
+ (NSString *)qb_getPreferencesDirectorie;

/** 获取 tmp 目录: 保存应用运行时所需要的临时数据。不会被iTunes备份。iPhone重启时，会被清空。 */
+ (NSString *)qb_getTmpDirectorie;



@end

NS_ASSUME_NONNULL_END
