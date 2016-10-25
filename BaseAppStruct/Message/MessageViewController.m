//
// MessageViewController.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "MessageViewController.h"
#import "MessagePipeline.h"
#import "Minya.h"

@interface MessageViewController ()

@property (nonatomic, strong) MessagePipeline *pipeline;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
