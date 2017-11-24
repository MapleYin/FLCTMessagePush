//
//  STMPMessageListCell.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/21.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPTableViewCell.h"
@class STMPMessageListCellViewModel;

@interface STMPMessageListCell : STMPTableViewCell

- (void)setupWithModel:(STMPMessageListCellViewModel *)model;

@end
