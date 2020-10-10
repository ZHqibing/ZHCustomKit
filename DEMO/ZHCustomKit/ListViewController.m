//
//  ListViewController.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/4/11.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "ListViewController.h"
#import "ZHSystemCameraViewController.h"


@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbv;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ListViewController

- (NSMutableArray*)dataArray {
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.dataArray addObject:@"继承系统相机"];
    [self.dataArray addObject:@"自定义相机"];
    [self.dataArray addObject:@"自定义录音"];
    [self.dataArray addObject:@"自定义视频录制"];
    
}


- (void)createTableView {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsHorizontalScrollIndicator = NO;
    
    tableView.separatorColor = [UIColor redColor];
    tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    tableView.tableFooterView = [UIView new];
    tableView.backgroundColor = self.view.backgroundColor;
    
    [self.view addSubview:tableView];
}

#pragma mark ---- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@""];
    
    NSString *title = self.dataArray[indexPath.row];
    cell.textLabel.text = title;
    
    return cell;
    
}

#pragma mark --- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 54;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            ZHSystemCameraViewController *vc = [[ZHSystemCameraViewController alloc] initWithType:1];
            
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case 1:
        {}
            break;
        case 2:
        {}
            break;
        case 3:
        {}
            break;
        case 4:
        {}
            break;
        case 5:
        {}
            break;
        case 6:
        {}
            break;
        case 7:
        {}
            break;
            
        default:
            break;
    }
    
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
