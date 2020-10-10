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

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) dispatch_source_t gcdTimer;

@property (nonatomic, strong) NSThread *thread1;
@property (nonatomic, strong) NSTimer *threadTimer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)abcc {
    
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


- (IBAction)testActionModel:(UIButton *)sender {
    
    [self presentViewController:[NSClassFromString(@"TestViewController") new] animated:YES completion:nil];
    
    
}




#pragma mark ---- timerTest
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_timer setFireDate:[NSDate distantFuture]];
    [_timer invalidate];
    
}
- (IBAction)timerTestAction:(UIButton *)sender {
    
    if (!_timer) {

//        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.00 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
        
//        __weak typeof(self)ws = self;
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            __strong typeof(ws)ss = ws;
//
//            ss.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
//            [[NSRunLoop currentRunLoop] addTimer:ss.timer forMode:NSRunLoopCommonModes];
//            [[NSRunLoop currentRunLoop] run];
//
//        });
        
//        __weak __typeof(self) weakSelf = self;
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//
//            __strong __typeof(weakSelf) strongSelf = weakSelf;
//            if (strongSelf) {
////                strongSelf.thread1 = [NSThread currentThread];
////                [strongSelf.thread1 setName:@"线程A"];
//                strongSelf.threadTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:strongSelf selector:@selector(timerRun) userInfo:nil repeats:YES];
//                NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//                [runloop addTimer:strongSelf.threadTimer forMode:NSRunLoopCommonModes];
//                [runloop run];
//            }
//        });

        
    } else {

        [_timer setFireDate:[NSDate distantFuture]];
        [_timer invalidate];
        _timer = nil;
    }
    
    
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0.0 * NSEC_PER_SEC);
//    dispatch_source_set_event_handler(timer, ^{
//
//        [self timerRun];
//
//    });
//    dispatch_resume(timer);
    
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, <#dispatchQueue#>);
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, <#intervalInSeconds#> * NSEC_PER_SEC, <#leewayInSeconds#> * NSEC_PER_SEC);
//    dispatch_source_set_event_handler(timer, ^{
//        <#code to be executed when timer fires#>
//    });
//    dispatch_resume(timer);
    
    
    //获得队列
    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(0, 0);
    //创建一个gcd定时器 (dispatch_source_t timer:dispatch_source_t本质还是个OC对象，是个局部变量，需要强引用，不然下面使用无效)
    self.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatchQueue);
    //OC对象%@可以打印
    NSLog(@"%@", self.gcdTimer);
    //设置定时器的各种属性（几时开始，每隔多长时间执行一次）
    //GCD时间参数，一般是纳秒 NSEC_PER_SEC 纳秒单位等于一秒；DISPATCH_TIME_NOW当前时间
    dispatch_time_t start = DISPATCH_TIME_NOW;
    uint64_t interval = (uint64_t)(1.0 *NSEC_PER_SEC);
    dispatch_source_set_timer(self.gcdTimer, start, interval, 0);
    dispatch_source_set_event_handler(self.gcdTimer, ^{

        [self timerRun];
    });
    //启动定时器
    dispatch_resume(self.gcdTimer);
    
    
    
}

- (void)timerRun {
    
    NSLog(@"timerTest");
    int count = 0;
    for (long i = 0; i < 1000000000; i++) {
        count += 1;
    }

    
    NSRunLoopCommonModes;
    NSDefaultRunLoopMode;
    UITrackingRunLoopMode;
    
    dispatch_queue_t queue = dispatch_queue_create("const_char_dispatch_timer", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{

        int count = 0;
        for (long i = 0; i < 1000000000; i++) {
            count += 1;
        }
    });
    
    
}

@end
