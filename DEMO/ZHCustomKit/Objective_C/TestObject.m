//
//  TestObject.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/11.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject
{
    /// 手动生成 setter 和 getter
    NSString *_pp1;
    NSString *_ppppppp;
    NSArray *_arr_ay;
}
///  自动生成 setter 和 getter
@synthesize pp2 = _pp2;
@synthesize selected = _selected;
@synthesize canAdd = _canAdd;
@dynamic pppp;

@synthesize array = _array_array;


+ (void)load {
    
    NSLog(@"%s",__func__);
}

+ (void)initialize {
    
    NSLog(@"%s",__func__);
}


- (void)loadDataWithComplete:(void (^)(void))hanlder {
    
    self.block = hanlder;
    
    NSLog(@"%@",self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self reloadDataWithBlock:hanlder];
        
    });
    
}

- (void)reloadDataWithBlock:(void(^)(void))hanlder {
    
    NSLog(@"%@",self);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
//        if (self.block) {
//            self.block();
//        }

        if (hanlder) {
            hanlder();
        }
        
    });
    
}


- (void)dealloc {
    
//    NSKeyedArchiver
    
    NSLog(@"%s",__func__);
}



#pragma mark ---- Protocol property

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setPp1:(NSString *)pp1 {
    _pp1 = pp1;
}
- (NSString *)pp1 {
    return _pp1;
}


- (void)testDelegate {
    
    if ([self.delegate respondsToSelector:@selector(testProtocloAction:)]) {
        [self.delegate testProtocloAction:@"hello objective-C"];
    }
    
}







- (void)setSelected:(BOOL)selected {
    _selected = selected;
}
- (BOOL)isSelected {
    return _selected;
}
- (void)setCanAdd:(BOOL)canAdd {
    _canAdd = canAdd;
}
- (void)setupCanAddAction:(BOOL)canAdd {
    _canAdd = canAdd;
}
- (BOOL)canAdd {
    return _canAdd;
}



- (void)setPppp:(NSString *)pppp {
    _ppppppp = pppp;
}
- (NSString *)pppp {
    return _ppppppp;
}



- (void)setArray:(NSArray *)array {
    _arr_ay = array;
}
- (NSArray *)array {
    return _arr_ay;
}



- (void)setAValue:(NSString *)v {
    _aValue = v;
}
- (NSString *)aValue {
    return _aValue;
}




- (void)setNameSpace:(NSString *)str {
    NSLog(@"");
}




- (id)valueForUndefinedKey:(NSString *)key {
    
    return @"undefine";
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    NSLog(@"");
    
}


@end
