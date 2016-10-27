//
// MineViewController.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "MineViewController.h"
#import "MinePipeline.h"
#import "Minya.h"
#import "UIViewController+SQExtension.h"

@interface MineViewController ()

@property (nonatomic, strong) MinePipeline *pipeline;

@end

@implementation MineViewController

- (void)loadView {
    [super loadView];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor redColor]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code
    [self.store fetchData];
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
