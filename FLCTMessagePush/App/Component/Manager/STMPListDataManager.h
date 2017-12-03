//
//  STMPListDataManager.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPDataManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface STMPListDataManager : STMPDataManager

@property (nonatomic, strong, readonly) NSArray* modelList;

- (NSUInteger)numberOfSection;
- (NSUInteger)numberOfRowsInSection:(NSUInteger)section;
- (nullable id)modelAtIndexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
