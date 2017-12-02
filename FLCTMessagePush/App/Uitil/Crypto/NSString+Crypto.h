//
//  NSString+Crypto.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/1.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Crypto)

- (nullable NSString *)st_aesEncrypt;
- (nullable NSString *)st_aesDecrypt;

@end

