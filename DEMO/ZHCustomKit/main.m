//
//  main.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/11.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"testMain");
        
//        UIApplicationMain(<#int argc#>, <#char * _Nullable * _Nonnull argv#>, <#NSString * _Nullable principalClassName#>, <#NSString * _Nullable delegateClassName#>)
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
