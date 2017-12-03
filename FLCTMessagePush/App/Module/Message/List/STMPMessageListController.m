//
//  STMPMessageListController.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/21.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPMessageListController.h"
#import "STMPMessageListCell.h"
#import "STMPMessageListDataManager.h"

#import "STMPAccountManager.h"
#import "STMPLoginController.h"

@interface STMPMessageListController ()

@property (nonatomic, assign) BOOL needAutoRefresh;

@end

@implementation STMPMessageListController

- (instancetype)init {
    self = [super init];
    if (self) {
        _needAutoRefresh = YES;
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self checkLoginStatus];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"信息";
    
    // table
    [self.tableView registerClass:STMPMessageListCell.class forCellReuseIdentifier:NSStringFromClass(STMPMessageListCell.class)];
    
    [self.refreshControl addTarget:self action:@selector(refreshEvent:) forControlEvents:UIControlEventValueChanged];
}

- (STMPMessageListDataManager *)dataManager {
    if(!_dataManager) {
        _dataManager = [STMPMessageListDataManager new];
    }
    return _dataManager;
}


#pragma mark - Action

- (void)refreshEvent:(UIRefreshControl *)control {
    if (control.refreshing) {
        [self loadData];
    }
}


#pragma mark - Private

- (void)checkLoginStatus {
    if (![STMPAccountManager sharedInstance].isLogin) {
        [self presentViewController:[STMPLoginController new] animated:YES completion:nil];
    } else if (self.needAutoRefresh){
        self.needAutoRefresh = NO;
        [self loadData];
    }
}

- (void)loadData {
    [self.dataManager loadData:^(NSArray<STMPMessageModel *> *result, NSError *error) {
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = [self.dataManager numberOfRowsInSection:section];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    STMPMessageListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(STMPMessageListCell.class) forIndexPath:indexPath];
    
    STMPMessageModel *model = [self.dataManager modelAtIndexPath:indexPath];
    
    [cell setupWithModel:model];
    
    [cell layoutIfNeeded];
    [cell layoutSubviews];
    
    return cell;
}

@end
