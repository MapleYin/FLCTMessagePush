//
//  STMPDataManager.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/22.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STMPDataManager : NSObject

@property (nonatomic, strong) NSArray* modelList;

- (NSUInteger)numberOfSection;
- (NSUInteger)numberOfRowsInSection:(NSUInteger)section;
- (id)modelAtIndexPath:(NSIndexPath *)indexPath;
- (void)loadData;

@end
