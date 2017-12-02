//
//  NSData+Crypto.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Crypto)

- (nullable NSData *)st_aesEncrypt;
- (nullable NSData *)st_aesDecrypt;

@end
