//
// ReportView.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "ReportView.h"
#import "UIView+MIPipeline.h"
#import "ReportPipeline.h"

@interface ReportView ()

@property (nonatomic, strong) ReportPipeline *pipeline;

@end

@implementation ReportView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
