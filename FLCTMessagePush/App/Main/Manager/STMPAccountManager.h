//
//  STMPAccountManager.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPDataManager.h"
@class STMPAccountModel;

NS_ASSUME_NONNULL_BEGIN

@interface STMPAccountManager : STMPDataManager

@property (nonatomic, assign, readonly) BOOL isLogin;
@property (nonatomic, strong, readonly, nullable) STMPAccountModel *account;

+ (instancetype)sharedInstance;

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
            completeBlock:(void(^)(BOOL success))complete;

- (void)updateAccount;

@end


NS_ASSUME_NONNULL_END
