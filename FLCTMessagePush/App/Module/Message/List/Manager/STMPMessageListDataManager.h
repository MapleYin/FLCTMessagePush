//
//  STMPMessageListDataManager.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/22.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPDataManager.h"

@class STMPMessageListCellViewModel;

@interface STMPMessageListDataManager : STMPDataManager

- (STMPMessageListCellViewModel *)modelAtIndexPath:(NSIndexPath *)indexPath;

@end
