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
#define kScaleLength(length) (length) * [UIScreen mainScreen].bounds.size.width / 320.0f

#define KC01_57c2de [UIColor colorWithHexString:@"#57c2de"]

@interface MineViewController ()

@property (nonatomic, strong) MinePipeline *pipeline;

@end

@implementation MineViewController

- (void)loadView {
    [super loadView];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code
    [self.store fetchData];
    
}

- (void)addObservers {
    
    @weakify(self)
    [MIObserve(self.pipeline, mContentOffset) changed:^(id _Nonnull newValue) {
        @strongify(self)
        [self navigationBarGradualChangeWithScrollViewContent:self.pipeline.mContentOffset offset:kScaleLength(190.5) color:KC01_57c2de];
    }];
}


- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
