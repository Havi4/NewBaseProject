//
// HomeViewController.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "HomeViewController.h"
#import "HomePipeline.h"
#import "Minya.h"

@interface HomeViewController ()

@property (nonatomic, strong) HomePipeline *pipeline;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
