//
//  STMPMessageListDataManager.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/22.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPListDataManager.h"

@class STMPMessageListCellViewModel;
@class STMPMessageModel;

@interface STMPMessageListDataManager : STMPListDataManager

- (STMPMessageModel *)modelAtIndexPath:(NSIndexPath *)indexPath;

- (void)loadData:(void(^)(NSArray<STMPMessageModel *> *result, NSError *error))complete;

@end
