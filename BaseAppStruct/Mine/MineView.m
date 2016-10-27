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
#import "MJRefresh.h"

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
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom).offset(-49);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
    __unsafe_unretained UITableView *tableView = self.userTableView;
    
    // 下拉刷新
    tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView.mj_header endRefreshing];
        });
    }];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    tableView.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新
    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView.mj_footer endRefreshing];
        });
    }];
}

#pragma mark - Properties Accessor

- (UITableView *)userTableView {
    if (!_userTableView) {
        _userTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _userTableView.delegate = self;
        _userTableView.dataSource = self;
        [_userTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ViewCell"];
    }
    
    return _userTableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 108;
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

#pragma mark - Notifying refresh control of scrolling

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pipeline.mContentOffset = scrollView.contentOffset;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
}

#pragma mark - Listening for the user to trigger a refresh


@end
