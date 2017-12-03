//
//  STMPResponseModel.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STMPResponseModel : NSObject

@property (nonatomic, assign, readonly) NSInteger code;
@property (nonatomic, strong, readonly) NSString *message;
@property (nonatomic, strong, readonly) id data;

- (NSError *)customError;

@end
