//
// HomeView.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "HomeView.h"
#import "UIView+MIPipeline.h"
#import "HomePipeline.h"

@interface HomeView ()

@property (nonatomic, strong) HomePipeline *pipeline;

@end

@implementation HomeView

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
