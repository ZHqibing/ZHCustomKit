//
//  SystemImagePickerViewController.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/4/11.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHSystemCameraViewController : UIImagePickerController

/**
 初始化控制器（）

 @param type 控制器类型（0：相机，1：摄像机，）默认为相机
 @return 相机控制器
 */
- (instancetype)initWithType:(NSInteger)type;

@end

NS_ASSUME_NONNULL_END
