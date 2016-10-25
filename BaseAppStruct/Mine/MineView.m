//
// MineView.m
// BaseAppStruct
//
// Created by Havi on 2016/10/25
// Copyright 2016 Havi. All right reserved.
//

#import "MineView.h"
#import "UIView+MIPipeline.h"
#import "MinePipeline.h"

@interface MineView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) MinePipeline *pipeline;
//private
@property (nonatomic, strong) UITableView *userTableView;

@end

@implementation MineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    [self addSubview:self.userTableView];
    //
    [self.userTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - Properties Accessor

- (UITableView *)userTableView {
    if (!_userTableView) {
        _userTableView = [[UITableView alloc] init];
        _userTableView.delegate = self;
        _userTableView.dataSource = self;
        [_userTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ViewCell"];
    }
    
    return _userTableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ViewCell"];
    cell.textLabel.text = self.pipeline.userInfo.nUserInfo.address;
    
    return cell;
}

- (void)dealloc {
    DeBugLog(@"%s", __FUNCTION__);
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
    @weakify(self)
    
    // Observe the flag property, and if data has been back from the server,
    // we can refresh the tableview.
    [MIObserve(self.pipeline, flagRequestFinished) changed:^(id  _Nonnull newValue) {
        
        @strongify(self)
        [self.userTableView reloadData];
    }];
}

@end
