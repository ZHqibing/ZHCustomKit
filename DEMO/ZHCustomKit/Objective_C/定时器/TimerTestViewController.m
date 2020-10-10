//
//  TimerTestViewController.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/21.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "TimerTestViewController.h"
#import "TimerActionModel.h"
#import "CricleModelTestB.h"
#import "CricleModelTestA.h"
#import "UIButton+Cate.h"


@interface TimerTestViewController ()
{
    NSTimer *_defaultTimer;
}
@property (nonatomic, strong) CricleModelTestA *modelA;
@property (nonatomic, strong) CricleModelTestB *modelB;

@end

@implementation TimerTestViewController


- (void)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)loadView {
    
    NSLog(@"loadView");
    
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = [UIColor redColor];
    self.view = v;
    
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    
    [back setName:@"你好呀"];
    NSLog(@"name = %@",[back name]);
    
    [back addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    [v addSubview:back];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"viewWillAppear");
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    NSLog(@"viewWillDisappear");
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    NSLog(@"viewDidDisappear");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    NSLog(@"viewWillLayoutSubviews");
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    NSLog(@"viewDidLayoutSubviews");
}

- (void)loadViewIfNeeded {
    [super loadViewIfNeeded];

    NSLog(@"loadViewIfNeeded");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"viewDidLoad");
    
//    self.modelA = [[CricleModelTestA alloc] init];
//    self.modelB = [[CricleModelTestB alloc] init];
//
//    [self.modelA extFunctionTest];
//
//    self.modelB.modelTestA = self.modelA;
//    self.modelA.modelTestB = self.modelB;
    
    
//    TimerActionModel *model = [[TimerActionModel alloc] init];
//    model.time = 0;
//    _defaultTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:model selector:@selector(timerRun:) userInfo:nil repeats:YES];
    
     
//    for (UIView *view = self.view; view; view = view.superview) {
//        UIResponder *nextResponder = [view nextResponder];
//
//        NSLog(@"%@",nextResponder.class);
//
//    }
    
    
}


- (IBAction)dismissActionTest:(UIButton *)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
    
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
