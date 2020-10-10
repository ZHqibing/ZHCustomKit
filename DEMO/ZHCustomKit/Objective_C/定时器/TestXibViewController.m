
//
//  TestXibViewController.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/21.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "TestXibViewController.h"
#import "TimerTestViewController.h"
#import "LayerTestView.h"

@interface TestXibViewController ()

@end

@implementation TestXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.view.layer.borderWidth
//    self.view.layer.
    
//    NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
//    [mDic setObject:nil forKey:@"key"];
    
    LayerTestView *view = [[LayerTestView alloc] init];
    view.frame = CGRectMake(100, 400, 200, 200);
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    
    view.layer.bounds;
    
    
    CALayer *mask = [CALayer layer];
    mask.frame = CGRectMake(20, 20, 80, 80);
    mask.backgroundColor = [UIColor redColor].CGColor;
    
//    mask.opacity
    
    UIBezierPath;
    
    UIView;
    
    CAShapeLayer;
    
    
//    view.layer.mask = mask;
    
//    view.layer.masksToBounds = YES;
//    view.clipsToBounds = YES;
    
    
    
    
}


- (IBAction)timerTest:(UIButton *)sender {
     
    TimerTestViewController *vc = [[TimerTestViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    
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
