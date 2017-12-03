//
//  STMPModel.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPResponseModel.h"

@interface STMPResponseModel()

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) id data;

@end

@implementation STMPResponseModel


- (NSError *)customError {
    if (self.code != 0) {
        NSError *error = [[NSError alloc] initWithDomain:@""
                                                    code:self.code
                                                userInfo:@{
                                                           NSLocalizedDescriptionKey:STAvailableString(self.message)
                                                           }];
        return error;
    }
    return nil;
}

@end
