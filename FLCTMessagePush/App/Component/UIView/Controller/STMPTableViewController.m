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
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableView];
    
}

- (STMPDataManager *)createDataManager {
    return [STMPDataManager new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [UITableViewCell new];
}


@end
