//
//  STMPTableViewController.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/21.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPTableViewController.h"
#import "STMPDataManager.h"

@interface STMPTableViewController ()

@end

@implementation STMPTableViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        
        _refreshControl = [[UIRefreshControl alloc] init];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.refreshControl = _refreshControl;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)setRefreshControl:(UIRefreshControl *)refreshControl {
    _refreshControl = refreshControl;
    self.tableView.refreshControl = refreshControl;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [UITableViewCell new];
}


@end
