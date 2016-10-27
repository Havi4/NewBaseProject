//
// DevicesView.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "DevicesView.h"
#import "UIView+MIPipeline.h"
#import "DevicesPipeline.h"

@interface DevicesView ()

@property (nonatomic, strong) DevicesPipeline *pipeline;

@end

@implementation DevicesView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kBackgroundColor;
    }
    return self;
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
