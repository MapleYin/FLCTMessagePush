//
//  NSDictionary+Crypto.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/1.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "NSDictionary+Crypto.h"
#import "STMPCrypto.h"
#import "NSData+Crypto.h"

@implementation NSDictionary (Crypto)


+ (nullable instancetype)st_aesDecrypt:(nullable NSData *)encryptData {
    NSData *decodeData = [encryptData st_aesDecrypt];
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:decodeData options:0 error:nil];
    return jsonObject;
}

- (NSData *)st_aesEncrypt {
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    if (!error) {
        return [[data st_AES128EncryptedDataWithKey:STMP_CRYPTO_SCRECT iv:STMP_CRYPTO_IV] base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    return nil;
}
@end
