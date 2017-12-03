//
//  STMPAccountManager.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPAccountManager.h"

#import "STMPResponseModel.h"

@interface STMPAccountManager()

@property (nonatomic, assign) BOOL isLogin;

@end

@implementation STMPAccountManager

STMPSingleton(STMPAccountManager)


- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
            completeBlock:(void(^)(BOOL success))complete {
    NSDictionary *params = @{
                             @"username":username,
                             @"password":password
                             };
    
    
    [STNRequest post:@"http://api.sms.maple.im/user/authorize"
              pramas:params
       completeBlock:^(STNResponse *response, STMPResponseModel *result) {
           BOOL loginSuccess = NO;
           if (!response.error) {
               if (result.code == 0) {
                   self.isLogin = YES;
                   [STNRequest setupGlobelHeadersValue:[NSString stringWithFormat:@"Bearer %@",result.data] key:@"authorization"];
                   loginSuccess = YES;
               }
           }
           if (complete) {
               complete(loginSuccess);
           }
       }];
}

- (void)updateAccount {
    
}

@end
