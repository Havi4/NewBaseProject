//
// ReportStore.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "ReportStore.h"
#import "ReportPipeline.h"
#import "Minya.h"

@interface ReportStore ()

@property (nonatomic, strong) ReportPipeline * reportPipeline;

@end

@implementation ReportStore

- (instancetype)initWithContext:(NSDictionary<NSString *,id> *)context {
    
    self = [super initWithContext:context];
    
    if (self) {
        
    }
    
    return self;
}

- (void)fetchData {
    
}

- (__kindof MIPipeline *)pipeline {
    return self.reportPipeline;
}

- (void)addObservers {
    
}

+ (NSArray<NSString *> *)requiredParameters {
    return nil;
}

#pragma mark - Pipeline

- (ReportPipeline *)reportPipeline {
    if (!_reportPipeline) {
        _reportPipeline = [[ReportPipeline alloc] init];
    }
    return _reportPipeline;
}

@end
