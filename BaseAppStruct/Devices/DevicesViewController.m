//
// DevicesViewController.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "DevicesViewController.h"
#import "DevicesPipeline.h"
#import "Minya.h"

@interface DevicesViewController ()

@property (nonatomic, strong) DevicesPipeline *pipeline;

@end

@implementation DevicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Add you own code 
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
