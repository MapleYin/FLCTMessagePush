//
//  STMPDataManager.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/22.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPDataManager.h"

@interface STMPDataManager()

@end

@implementation STMPDataManager

- (NSUInteger)numberOfSection {
    return 0;
}

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section {
    return self.modelList.count;
}

- (id)modelAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)loadData {
    
}

@end
