//
//  TestViewController.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/12.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "TestViewController.h"
#import "TestObject.h"
#import <objc/objc.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface TestViewController ()

@property (nonatomic, strong) TestObject *obj;

@end

@implementation TestViewController


- (void)dis {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
    Class cls = objc_getClass("TestObject");
    
    id obj = [cls new];
    
    NSLog(@"name:%s; instanceSize:%s; version:%s",class_getName(cls), class_getInstanceSize(cls), class_getVersion(cls) );
    
    
    
    id str = [[NSString alloc] init];
    str = [str stringByAppendingString:@"name"];
    
    id string = [[cls alloc] initWithString:@"name"];
    // unrecognized selector sent to instance 0x6000007f9f80'
    
    
    NSLog(@"");
}

- (void)setupUI {
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 40, 40)];
    btn1.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(dis) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(20, 130, 40, 40)];
    btn2.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(objc) forControlEvents:(UIControlEventTouchUpInside)];
    

    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(20, 230, 40, 40)];
    btn3.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(selfObj) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    [UIView animateWithDuration:1 animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}

- (void)objc {
    
    // 这里self 没有强制持有obj1 ，所以 obj1 会在初始化后不用时直接释放。所以这里不会导致循环引用。。
    
    TestObject *obj1 = [TestObject new];
    [obj1 loadDataWithComplete:^{
        
        // 这里 obj1 强制持有 self
        self.view.backgroundColor = [UIColor orangeColor];
        NSLog(@"为什么会这样呢。。。");
        
    }];
    
}

- (void)selfObj {
    
    // 这里 self 强制持有 obj，
    // 如果 obj 里面有self 里会有可能导致循环引用。。
    // 如果 obj 没有self，里面不会导致循环引用。。
    
    self.obj = [TestObject new];
    [self.obj loadDataWithComplete:^{
        
        // 同时 obj 也会强制持有 self
        self.view.backgroundColor = [UIColor cyanColor];
        NSLog(@"哈哈啊哈哈");
        
    }];
    
}

- (void)dealloc {
    
    NSLog(@"%s",__func__);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
