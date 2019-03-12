//
//  ViewController.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/11.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+qbCopy.h"
#import "TestObject.h"
#import "ZHCustomCommon.h"

#import "UIView+zhLoading.h"
#import "NSFileManager+qbExtension.h"

@interface ViewController ()<zhLoadingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    label.text = @"this is a label。";
    
    label.isCopyable = YES;
    
    TestObject *obj1 = [TestObject new];
    NSLog(@"obj1 = %@",obj1);
     
    
    ZHLog(@"obj1 = %@",obj1);
    
    NSLog(@"%@",NSStringFromCGSize(zh_screen_size));
    BOOL isIX = zh_is_iphoneX;
    if (zh_is_iphoneX) {
        ZHLog(@"zh_is_iphoneX");
    } else {
        ZHLog(@"。。。。");
    }
    
    
    self.view.loadingDelegate = self;
    
    
}

- (IBAction)cutWrite:(UIButton *)sender {
    
    ////
    NSString *document = [NSFileManager qb_getDocumentsDirectorie];
    NSString *readPath = [[NSBundle mainBundle] pathForResource:@"005" ofType:@"png"];
    NSFileHandle *readHand = [NSFileHandle fileHandleForReadingAtPath:readPath];
    
    NSData *img = [NSData dataWithContentsOfFile:readPath];

    
    ////
    NSString *writePath = [[NSFileManager qb_getCachesDirectorie] stringByAppendingPathComponent:@"test.png"];
    // 创建并覆盖文件
    BOOL suc = [[NSFileManager defaultManager] createFileAtPath:writePath contents:nil attributes:nil];
     
    NSFileHandle *writeHand = [NSFileHandle fileHandleForWritingAtPath:writePath];
   
    
    long long len = 1024*1024;
    long long offset = 0;
    long long totalLen = [readHand seekToEndOfFile];
    if (readHand && writeHand) {
        
        while (offset < totalLen) {
            [readHand seekToFileOffset:offset];
            offset += len;
            NSData *data = [readHand readDataOfLength:len];
            NSLog(@"offset = %lld, data = %ld, offsetInFile = %lld",offset, data.length, readHand.offsetInFile);
            
            [writeHand seekToEndOfFile];
            [writeHand writeData:data];
        }
        
        long long total = [writeHand seekToEndOfFile];
        NSLog(@"写入完成 = %lld",total);
        
        [readHand closeFile];
        [writeHand closeFile];
    }
    
    
    ZHLog(@"document = %@",document);
    
}

- (IBAction)testAction:(UIButton *)sender {
    
    [self.view zh_startLoading];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.view zh_stopLoading];
        
    });
    
}
- (IBAction)loadFailer:(UIButton *)sender {
    
    [self.view zh_startLoading];
    
    __weak typeof(self)ws = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ws.view zh_loadFailerWith:@"加载失败，点击重试！" tapBlock:^{
            [ws testAction:sender];
        }];
        
    });
    
}

- (IBAction)loadFailerDelegate:(UIButton *)sender {
    
    [self.view zh_startLoading];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.view zh_loadFailerWith:@"xxxoooo" tapBlock:nil];
        
    });
    
}

- (void)zh_loadingViewAgainReloadData:(UIView *)view {
    
    [self loadFailer:nil];
}






- (IBAction)documentAdd:(UIButton *)sender {
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    NSString *doctest = [[NSFileManager qb_getDocumentsDirectorie] stringByAppendingPathComponent:@"DocuTest"];
    
    BOOL isDir = NO;
    BOOL success = NO;
    NSError *error = nil;
    BOOL have = [mgr fileExistsAtPath:doctest isDirectory:&isDir];
    if (have) {
        NSLog(@"文件路径存在了......");
    } else {
       success = [mgr createDirectoryAtPath:doctest withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    NSDictionary *dict = @{@"name":@"jorden", @"age":@(22), @"sex":@(true)};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    success = NO;
    success = [mgr createFileAtPath:[doctest stringByAppendingPathComponent:@"test.json"] contents:data attributes:nil];
    if (success) {
        
    }
    success = NO;
    success = [mgr createFileAtPath:[[NSFileManager qb_getDocumentsDirectorie] stringByAppendingPathComponent:@"user.json"] contents:data attributes:nil];
    
    /// 写入数据
    NSString *str = @"\"tom\":\"action\"";
    success = NO;
    success = [str writeToFile:[doctest stringByAppendingPathComponent:@"test.json"] atomically:NO encoding:NSUTF8StringEncoding error:&error];
    
//    [data writeToFile:<#(nonnull NSString *)#> options:<#(NSDataWritingOptions)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>]
    
    
    
    NSLog(@"");
    
    
}


- (IBAction)libAdd:(UIButton *)sender {
    
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    NSString *doctest = [[NSFileManager qb_getLibraryDirectorie] stringByAppendingPathComponent:@"DocuTest"];
    
    BOOL isDir = NO;
    BOOL success = NO;
    NSError *error = nil;
    BOOL have = [mgr fileExistsAtPath:doctest isDirectory:&isDir];
    if (have) {
        NSLog(@"文件路径存在了......");
    } else {
        success = [mgr createDirectoryAtPath:doctest withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    NSDictionary *dict = @{@"name":@"jorden", @"age":@(22), @"sex":@(true)};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    success = NO;
    success = [mgr createFileAtPath:[doctest stringByAppendingPathComponent:@"test.json"] contents:data attributes:nil];
    if (success) {
        
    }
    
    success = NO;
    success = [mgr createFileAtPath:[[NSFileManager qb_getLibraryDirectorie] stringByAppendingPathComponent:@"user.json"] contents:data attributes:nil];
    
    NSLog(@"");
    
}

- (IBAction)cachesAdd:(id)sender {
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    NSString *doctest = [[NSFileManager qb_getCachesDirectorie] stringByAppendingPathComponent:@"DocuTest"];
    
    BOOL isDir = NO;
    BOOL success = NO;
    NSError *error = nil;
    BOOL have = [mgr fileExistsAtPath:doctest isDirectory:&isDir];
    if (have) {
        NSLog(@"文件路径存在了......");
    } else {
        success = [mgr createDirectoryAtPath:doctest withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    NSDictionary *dict = @{@"name":@"jorden", @"age":@(22), @"sex":@(true)};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    success = NO;
    success = [mgr createFileAtPath:[doctest stringByAppendingPathComponent:@"test.json"] contents:data attributes:nil];
    if (success) {
        
    }
    success = NO;
    success = [mgr createFileAtPath:[[NSFileManager qb_getCachesDirectorie] stringByAppendingPathComponent:@"user.json"] contents:data attributes:nil];
    
    NSLog(@"");
    
}

- (IBAction)per:(id)sender {
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    NSString *doctest = [[NSFileManager qb_getPreferencesDirectorie] stringByAppendingPathComponent:@"DocuTest"];
    
    BOOL isDir = NO;
    BOOL success = NO;
    NSError *error = nil;
    BOOL have = [mgr fileExistsAtPath:doctest isDirectory:&isDir];
    if (have) {
        NSLog(@"文件路径存在了......");
    } else {
        success = [mgr createDirectoryAtPath:doctest withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    NSDictionary *dict = @{@"name":@"jorden", @"age":@(22), @"sex":@(true)};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    success = NO;
    success = [mgr createFileAtPath:[doctest stringByAppendingPathComponent:@"test.json"] contents:data attributes:nil];
    if (success) {
        
    }
    
    success = NO;
    success = [mgr createFileAtPath:[[NSFileManager qb_getPreferencesDirectorie] stringByAppendingPathComponent:@"user.json"] contents:data attributes:nil];
    
    NSLog(@"");
    
}

- (IBAction)tmpAdd:(id)sender {
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    NSString *doctest = [[NSFileManager qb_getTmpDirectorie] stringByAppendingPathComponent:@"DocuTest"];
    
    BOOL isDir = NO;
    BOOL success = NO;
    NSError *error = nil;
    BOOL have = [mgr fileExistsAtPath:doctest isDirectory:&isDir];
    if (have) {
        NSLog(@"文件路径存在了......");
    } else {
        success = [mgr createDirectoryAtPath:doctest withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    NSDictionary *dict = @{@"name":@"jorden", @"age":@(22), @"sex":@(true)};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    success = NO;
    success = [mgr createFileAtPath:[doctest stringByAppendingPathComponent:@"test.json"] contents:data attributes:nil];
    if (success) {
        
    }
    
    success = NO;
    success = [mgr createFileAtPath:[[NSFileManager qb_getTmpDirectorie] stringByAppendingPathComponent:@"user.json"] contents:data attributes:nil];
    
    NSLog(@"");
    
}

@end
