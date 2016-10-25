//
// MessageStore.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "MessageStore.h"
#import "MessagePipeline.h"
#import "Minya.h"

@interface MessageStore ()

@property (nonatomic, strong) MessagePipeline * messagePipeline;

@end

@implementation MessageStore

- (instancetype)initWithContext:(NSDictionary<NSString *,id> *)context {
    
    self = [super initWithContext:context];
    
    if (self) {
        
    }
    
    return self;
}

- (void)fetchData {
    
}

- (__kindof MIPipeline *)pipeline {
    return self.messagePipeline;
}

- (void)addObservers {
    
}

+ (NSArray<NSString *> *)requiredParameters {
    return nil;
}

#pragma mark - Pipeline

- (MessagePipeline *)messagePipeline {
    if (!_messagePipeline) {
        _messagePipeline = [[MessagePipeline alloc] init];
    }
    return _messagePipeline;
}

@end
