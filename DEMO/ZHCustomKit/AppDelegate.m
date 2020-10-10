//
//  AppDelegate.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/11.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "AppDelegate.h"

#import <objc/objc.h>
#import <objc/runtime.h>
#import <objc/message.h>

#import "TestObject.h"
#import "MRCTestModel.h"
#import "ARCTestModel.h"
#import "msgSendModel.h"
#import "Woman.h"
#import "ArchiveModel.h"
#import "ThreadModel.h"
#import "NSFileManager+qbExtension.h"

#import "copyTestModel.h"
#import "assinTestModel.h"
#import "weakTestModel.h"

#import "TestXibViewController.h"
#import "ListViewController.h"

static NSString *blockStr = @"你好";

@interface AppDelegate ()<CustomProtocol>
{
    NSString *_testName;
    NSString *_defaultName;
    NSTimer *_defaultTimer;
}
@property (nonatomic, copy) ArchiveModel *model;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSLock *lock;

@property (nonatomic, copy) copyTestModel *cpyModel;
@property (nonatomic, assign) assinTestModel *asiModel;
@property (nonatomic, weak) weakTestModel *wkModel;

@end

@implementation AppDelegate

/// protocol 里面的
@synthesize pp1;
@synthesize pp2;


- (void)testProtocloAction:(NSString *)name {
    NSLog(@"%@",name);
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@" -- %@",[change objectForKey:NSKeyValueChangeNewKey]);
    }
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

//    
//    TestObject *obj = [[TestObject alloc] init];
//    [obj setValue:@"哈哈哈哈" forKey:@"_testValue"];
//    id value = [obj valueForKey:@"_testValue"];
//    
//    [obj setValue:@"jjd" forKey:@"kkkk"];
//    value = [obj valueForKey:@"kkkk"];
//    
//    
//    obj = nil;
//    
//    [obj setValue:@"呵呵呵呵呵" forKey:@"testValue"];
//    value = [obj valueForKey:@"testValue"];
//    
    
    
//    self.name = @"jack";
//    [self addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:nil];
//    NSLog(@"1");
//    [self willChangeValueForKey:@"name"];
//    NSLog(@"2");
//    [self didChangeValueForKey:@"name"];
//    NSLog(@"3");
    
    
    
//    __block NSString *str = @"hello";
//    void (^block)(void) = ^(void) {
//        NSLog(@"str = %@",str);
//        str = [str stringByAppendingString:@" objective-C"];
//        blockStr = [blockStr stringByAppendingString:@"，我是一个在堆里面的变量"];
//        if (str) {
//
//        }
//    };
//
//    block();
//
//
//    self.cpyModel = [[copyTestModel alloc] init];
//
//    self.asiModel = [[assinTestModel alloc] init];
//
//    self.wkModel = [[weakTestModel alloc] init];
//
//
//
//    msgSendModel *mm0 = [msgSendModel new];
////    [mm0 dynamicAddMethod];
////    [mm0 msgSendTest];
//    [mm0 objcMsgForwardTest];
//
    
    
//    SEL selA = @selector(setName:);
//    SEL selB = sel_registerName("setName:");
//    
//    const char *nameA = sel_getName(selA);
//    const char *nameB = sel_getName(selB);
//    
//    
//    SEL sel = @selector(setNameSpace:);
//    TestObject *obj = [[TestObject alloc] init];
//    if ([obj respondsToSelector:sel]) {
//        objc_msgSend(obj, sel, @[@"A",@"B"]);
//        
//        id res = [obj performSelector:sel withObject:@[@"AA",@"BB"] withObject:@{@"key1":@"value1",@"key2":@"value2"}];
//        if (res) {
//            
//        }
//        
//        Method md = class_getInstanceMethod(obj.class, sel);
//        IMP imp0 = method_getImplementation(md);
////        method_getImplementation(<#Method  _Nonnull m#>)
//        IMP imp1 = class_getMethodImplementation(obj.class, sel);
//        
//        IMP imp = [obj methodForSelector:sel];
//        void (*func)(id,SEL,...) = (void*)imp;
//        func(obj,sel,@[@"111",@"222"],@{@"111":@"aaa",@"222":@"bbb"});
//    }
//    
//    
//    NSLog(@"A = %s; B = %s",nameA, nameB);
    
#pragma mark ----
//    self.model = [[ArchiveModel alloc] init];
//    self.model.name = @"小刘";
    
//    self.lock = [[NSLock alloc] init];
//    self.count = 50;
//     
//    while (self.count > 0) {
//        
//        NSThread *th = [[NSThread alloc] initWithTarget:self selector:@selector(setCountAction) object:nil];
//        [th start];
////        NSLog(@"操作完成后的count= %ld",self.count);
//    }
    
    
//    ThreadModel *model = [ThreadModel new];
//    [model lockTestAction];

    
//    TestObject *obj1 = [[TestObject alloc] init];
//    obj1.delegate = self;
//    [obj1 testDelegate];
//
//    obj1.pp1 = @"this is protocol property";
//    obj1.pp2 = 123;
//
//    obj1.canAdd = YES;
//    [obj1 setupCanAddAction:NO];
//
//    obj1.pppp = @"hahhaaha";
//    obj1.array = @[@"111",@"222"];
//    NSArray *arr = obj1.array;
//
//    obj1.aValue = @"this is a value";
//    NSString *value = obj1.aValue;
//
//    NSLog(@"%@ -- %ld -- pppp : %@",obj1.pp1, obj1.pp2, obj1.pppp);
    
    
//    TestObject *obj = [TestObject new];
//    [obj loadDataWithComplete:^{
//
//    }];
//
//    ///
//    MRCTestModel *mrc = [[MRCTestModel alloc] init];
//    [mrc mrcTest];
//
//    ///
//    ARCTestModel *arc = [[ARCTestModel alloc] init];
//    [arc arcTest];
//
//    ///
//    msgSendModel *msg = [msgSendModel new];
//    [msg objcSengAction];
//
    ///
    
    //// 消息转发
//    Woman *woman = [Woman new];
////    [woman stringByAppendingString:@"name"];
////    woman.name = @"";
////    [woman testFuncWithK:nil kt:nil kth:nil];
//    [Woman test];
//    
//    NSLog(@"%s; %d; %s",__FILE__, __LINE__, __func__);
    
//    unsigned int count = 0;
//    objc_property_t *pl = class_copyPropertyList(object_getClass(woman), &count);
//    for (int i = 0; i < count; i++) {
//        const char *name = property_getName(pl[i]);
//        objc_property_t pp = class_getProperty(object_getClass(woman), name);
//        const char *att = property_getAttributes(pp);
//        NSLog(@"%s ; %s",name, att);
//    }
//
//    unsigned int ivarCount = 0;
//    Ivar *ivarList = class_copyIvarList([woman class], &ivarCount);
//    for (int i = 0; i < ivarCount; i++) {
//        const char* name = ivar_getName(ivarList[i]);
//        const char* TypeEncoding = ivar_getTypeEncoding(ivarList[i]);
//        NSLog(@"%s ; %s", name, TypeEncoding);
//    }
//
//
//    ArchiveModel *md = [[ArchiveModel alloc] init];
//    md.name = @"name";
//    md.array = @[@(1),@(2)].mutableCopy;
//    md.idCard = @(1235);
//    md.age = 18;
//
//    BOOL res = [md archiveSelfWithFile:@""];
//
//    ArchiveModel *mmd = (ArchiveModel *)[ArchiveModel unArchiveSelfWithFile:@""];
//    if (mmd) {
//        mmd.age;
//    }
//
//
//    NSString *str = [NSFileManager qb_getDocumentsDirectorie];
//    str = [str stringByAppendingString:@"/testDir/lastDir/testFile.json"];
//    NSError *error = nil;
//    BOOL bl = [[NSFileManager defaultManager] createDirectoryAtPath:str withIntermediateDirectories:NO attributes:nil error:&error];
//    if (bl) {
//
//    }
//
//    [ArchiveModel classMethod];
//    [NSObject classMethod];
//
//
//    NSString *str2 = @"";
//    Class cls1 = [str2 class];
//    Class cls2 = [NSString class];
//
//    ArchiveModel *md2 = [ArchiveModel new];
//    Class cls3 = object_getClass(md2);
//    Class cls4 = object_getClass([ArchiveModel class]);
//    Class cls5 = object_getClass([md2 class]);
//
//    BOOL is3 = class_isMetaClass(cls3);
//    BOOL is4 = class_isMetaClass(cls4);
//    BOOL is5 = class_isMetaClass(cls5);
//
//    ArchiveModel *model = [ArchiveModel alloc];
//    NSLog(@"-- %ld",[model retainCount]);
//    model = [model init];
//    NSLog(@"-- %ld",[model retainCount]);
//
//    NSNumber *num = [NSNumber alloc];
//    NSLog(@"%ld",[num retainCount]);
//    num = [num init];
//    NSLog(@"%ld",[num retainCount]);
//
//    NSString *s = [NSString alloc];
//    s = [s init];
    
//    TestXibViewController *vc = [[TestXibViewController alloc] init];
//    self.window.rootViewController = vc;
//    [self.window makeKeyAndVisible];
    
    
    ListViewController *vc = [[ListViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
 
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    
    if (self.model) {
        self.model.name = @"老王";
    }
    if (self.model.name) {
        
    }
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
