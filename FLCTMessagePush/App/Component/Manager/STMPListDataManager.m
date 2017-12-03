//
//  STMPListDataManager.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPListDataManager.h"

@implementation STMPListDataManager

- (NSUInteger)numberOfSection {
    return 0;
}

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section {
    return self.modelList.count;
}

- (id)modelAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
