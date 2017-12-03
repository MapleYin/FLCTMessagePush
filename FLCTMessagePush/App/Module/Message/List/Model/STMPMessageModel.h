//
//  STMPMessageModel.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPResponseModel.h"

@interface STMPMessageModel : STMPResponseModel

@property (nonatomic, strong, readonly) NSString *content;
@property (nonatomic, strong, readonly) NSString *from;
@property (nonatomic, strong, readonly) NSString *to;
@property (nonatomic, strong, readonly) NSDate *date;

@end
