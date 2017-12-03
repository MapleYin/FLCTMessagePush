//
//  STMPCommonDefined.h
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#define STMPSingleton(aclass) \
+ (instancetype)sharedInstance { \
    static aclass *instance = nil;\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{ \
    instance = [[aclass alloc] init] ;\
    }) ;\
    return instance ;\
}
