//
//  STMPTableViewController.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/21.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPViewController.h"
@class STMPDataManager;

@interface STMPTableViewController : STMPViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end
