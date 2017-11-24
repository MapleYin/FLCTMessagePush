//
//  STMPMessageListController.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/21.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPTableViewController.h"

@class STMPMessageListDataManager;

@interface STMPMessageListController : STMPTableViewController

@property (nonatomic, strong) STMPMessageListDataManager *dataManager;

@end
