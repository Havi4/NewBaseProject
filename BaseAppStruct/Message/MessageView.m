//
// MessageView.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "MessageView.h"
#import "UIView+MIPipeline.h"
#import "MessagePipeline.h"

@interface MessageView ()

@property (nonatomic, strong) MessagePipeline *pipeline;

@end

@implementation MessageView

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
