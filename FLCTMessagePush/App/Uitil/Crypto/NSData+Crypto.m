//
//  NSData+Crypto.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "NSData+Crypto.h"
#import "STMPCrypto.h"

@implementation NSData (Crypto)

- (NSData *)st_aesEncrypt {
    NSData *encodeData = [[self st_AES128EncryptedDataWithKey:STMP_CRYPTO_SCRECT iv:STMP_CRYPTO_IV] base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return encodeData;
}

- (NSData *)st_aesDecrypt {
    
    NSData *encodeData = [[NSData alloc] initWithBase64EncodedData:self options:0];
    
    return [encodeData st_AES128DecryptedDataWithKey:STMP_CRYPTO_SCRECT iv:STMP_CRYPTO_IV];
}


@end
