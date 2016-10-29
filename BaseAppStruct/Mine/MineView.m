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
#import "MineReuseTableViewCell.h"
#import "MineHeaderTableViewCell.h"
#import "MineWeatherTableViewCell.h"

@interface MineView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) MinePipeline *pipeline;
//private
@property (nonatomic, strong) UITableView *userTableView;
@property (nonatomic, strong) NSArray *cellShowArr;

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
    NSString *settingPath = [[NSBundle mainBundle]pathForResource:@"Setting" ofType:@"plist"];
    self.cellShowArr = [NSArray arrayWithContentsOfFile:settingPath];
    //
}

#pragma mark - Properties Accessor

- (UITableView *)userTableView {
    if (!_userTableView) {
        _userTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _userTableView.delegate = self;
        _userTableView.dataSource = self;
        [_userTableView setSeparatorColor:kBackgroundColor];
        _userTableView.backgroundColor = kBackgroundColor;
    }
    
    return _userTableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cellShowArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.cellShowArr objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row ==0) {
            MineHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerCell"];
            if (!cell) {
                cell = [[MineHeaderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headerCell"];
            }
            return cell;
        }else{
            MineWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherCell"];
            if (!cell) {
                cell = [[MineWeatherTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"weatherCell"];
            }
            return cell;
        }
    }else{
        MineReuseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell"];
        if (!cell) {
            cell = [[MineReuseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseCell"];
        }
        [cell configureCellWith:[[self.cellShowArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row] andIndex:indexPath];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row ==0) {
        return 80;
    }else{
        return 49;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section !=3) {
        return 15;
    }else{
        return 0.01;
    }
}

-(void)viewDidLayoutSubviews {
    if ([_userTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_userTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_userTableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [_userTableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.pipeline.selectedIndexPath = indexPath;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
