//
//  NSDictionary+Crypto.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/1.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Crypto)

+ (nullable instancetype)st_aesDecrypt:(nullable NSData *)encryptData;
- (nullable NSData *)st_aesEncrypt;

@end
