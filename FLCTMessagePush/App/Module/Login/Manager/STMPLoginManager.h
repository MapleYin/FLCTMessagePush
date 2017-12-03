//
//  STMPLoginManager.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/1.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPDataManager.h"

@interface STMPLoginManager : STMPDataManager

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
            completeBlock:(void(^)(BOOL success))complete;

@end
