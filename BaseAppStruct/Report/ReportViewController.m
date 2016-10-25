//
// ReportViewController.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "ReportViewController.h"
#import "ReportPipeline.h"
#import "Minya.h"

@interface ReportViewController ()

@property (nonatomic, strong) ReportPipeline *pipeline;

@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
