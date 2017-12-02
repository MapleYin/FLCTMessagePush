//
//  NSString+Crypto.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/1.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "NSString+Crypto.h"
#import "STMPCrypto.h"

@implementation NSString (Crypto)

- (NSString *)st_aesEncrypt {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encodeData = [[data st_AES128EncryptedDataWithKey:STMP_CRYPTO_SCRECT iv:STMP_CRYPTO_IV] base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return [[NSString alloc] initWithData:encodeData encoding:NSUTF8StringEncoding];;
}

- (NSString *)st_aesDecrypt {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    NSData *encodeData = [data st_AES128DecryptedDataWithKey:STMP_CRYPTO_SCRECT iv:STMP_CRYPTO_IV];
    return [[NSString alloc] initWithData:encodeData encoding:NSUTF8StringEncoding];;
}


@end

