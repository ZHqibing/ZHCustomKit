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
#import "TestModel.h"

@interface ViewController ()

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
    
    
    TestModel *model1 = [TestModel new];
    NSLog(@"model1 = %@",model1);
    
}


@end
