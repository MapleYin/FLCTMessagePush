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


@interface STMPMessageListController ()

@end

@implementation STMPMessageListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // table
    [self.tableView registerClass:STMPMessageListCell.class forCellReuseIdentifier:NSStringFromClass(STMPMessageListCell.class)];
    
    [self.dataManager loadData];
}

- (STMPMessageListDataManager *)dataManager {
    if(!_dataManager) {
        _dataManager = [STMPMessageListDataManager new];
    }
    return _dataManager;
}


#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataManager numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    STMPMessageListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(STMPMessageListCell.class) forIndexPath:indexPath];
    
    STMPMessageListCellViewModel *model = [self.dataManager modelAtIndexPath:indexPath];
    
    [cell setupWithModel:model];
    
    return cell;
}

@end
