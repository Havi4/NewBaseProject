//
// DevicesStore.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "DevicesStore.h"
#import "DevicesPipeline.h"
#import "Minya.h"

@interface DevicesStore ()

@property (nonatomic, strong) DevicesPipeline * devicesPipeline;

@end

@implementation DevicesStore

- (instancetype)initWithContext:(NSDictionary<NSString *,id> *)context {
    
    self = [super initWithContext:context];
    
    if (self) {
        
    }
    
    return self;
}

- (void)fetchData {
    
}

- (__kindof MIPipeline *)pipeline {
    return self.devicesPipeline;
}

- (void)addObservers {
    
}

+ (NSArray<NSString *> *)requiredParameters {
    return nil;
}

#pragma mark - Pipeline

- (DevicesPipeline *)devicesPipeline {
    if (!_devicesPipeline) {
        _devicesPipeline = [[DevicesPipeline alloc] init];
    }
    return _devicesPipeline;
}

@end
