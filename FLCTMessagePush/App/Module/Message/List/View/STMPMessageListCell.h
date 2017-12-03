//
//  STMPMessageListCell.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/21.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPTableViewCell.h"
@class STMPMessageModel;

@interface STMPMessageListCell : STMPTableViewCell


- (void)setupWithModel:(STMPMessageModel *)model;

@end
