# ZHCustomKit
这是一个用cocoapods 管理的第三方库，里面现在有一个简单的类别，具体使用请看具体文件说明。该框架至少需要iOS 9.0，目前只做了iOS 的适配。

## 使用说明

### n如果你想你的工程忽略某些具体的常量，请导入   pod 'ZHCustomKit' 所有功能
```
/// 导入部分定义好的常量
#import <ZHCustomKit/ZHCustomCommon.h>

/// 导入一个可以复制的label
#import <ZHCustomKit/UILabel+qbCopy.h>


- (void)testFunction {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    label.text = @"this is a label。";
    
    label.isCopyable = YES;
    
    NSLog(@"%@",NSStringFromCGSize(zh_screen_size));
    BOOL isIX = zh_is_iphoneX;
    if (zh_is_iphoneX) {
    ZHLog(@"zh_is_iphoneX");
    } else {
    ZHLog(@"。。。。");
    }

}


```

### 如果你不想要所有的功能，那么只需要导入指定的文件即可   pod 'ZHCustomKit/QBCategory'

```
/// 导入一个可以复制的label
#import <ZHCustomKit/UILabel+qbCopy.h>


- (void)testFunction {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    label.text = @"this is a label。";
    
    label.isCopyable = YES;
}

```
## 当然你也可以手动的方式导入该框架，直接下载到本地，将你需要的文件拷贝到工程里面即可。
