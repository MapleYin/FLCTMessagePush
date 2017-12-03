//
//  STNRequest+Init.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import <STNetWork/STNetWork.h>

@class STMPResponseModel;

typedef void(^STMPResponseBlock)(STNResponse *response, STMPResponseModel *result);

@interface STNRequest (Init)

+ (instancetype)post:(NSString *)url
              pramas:(id)params
       completeBlock:(STMPResponseBlock)complete;

+ (instancetype)get:(NSString *)url
             pramas:(id)params
      completeBlock:(STMPResponseBlock)complete;

@end
