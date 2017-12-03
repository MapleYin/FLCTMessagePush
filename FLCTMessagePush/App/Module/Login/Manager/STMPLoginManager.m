//
//  STMPLoginManager.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/1.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPLoginManager.h"
#import "NSDictionary+Crypto.h"
#import "STMPResponseModel.h"

@implementation STMPLoginManager

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
            completeBlock:(void(^)(BOOL success))complete {
    
    NSDictionary *params = @{
                             @"username":username,
                             @"password":password
                             };

    [STNRequest post:@"http://api.sms.maple.im/user/authorize"
             rawData:[params st_aesEncrypt]
       completeBlock:^(STNResponse *response) {
           BOOL loginSuccess = NO;
           if (!response.error) {
               NSDictionary *result = [NSDictionary st_aesDecrypt:response.result.rawData];
               STMPResponseModel *model = [STMPResponseModel yy_modelWithJSON:result];
               if (model.code == 0) {
                   [STNRequest setupGlobelHeadersValue:[NSString stringWithFormat:@"Bearer %@",model.data] key:@"authorization"];
                   loginSuccess = YES;
               }
           }
           if (complete) {
               complete(loginSuccess);
           }
    }];

}

@end
