//
//  STNRequest+Init.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/12/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STNRequest+Init.h"
#import "STMPResponseModel.h"
#import "NSDictionary+Crypto.h"
#import "NSData+Crypto.h"

@implementation STNRequest (Init)

+ (instancetype)urlString:(NSString *)urlString
                   pramas:(id)params
                   method:(STNRequestMethod)method
            completeBlock:(STMPResponseBlock)complete {
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:urlString];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    if (!url) {
        return nil;
    }
    
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    switch (method) {
        case STNRequestMethodPost: {
            request.HTTPMethod = @"POST";
            NSData *data = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
            request.HTTPBody = [data st_aesEncrypt];
            [request setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
        }
            
            break;
        case STNRequestMethodGet: {
            if ([params isKindOfClass:NSDictionary.class]) {
                urlComponents.query = [self dictionaryToQueryString:params];
            }
            url = [NSURL URLWithString:urlComponents.string];
            request = [[NSMutableURLRequest alloc] initWithURL:url];
            request.HTTPMethod = @"GET";
            
        }
            break;
        default:
            break;
    }
    
    
    
    void (^resultBlock)(STNResponse *response) = ^(STNResponse *response) {
        STMPResponseModel *model;
        if (!response.error) {
            NSDictionary *result = [NSDictionary st_aesDecrypt:response.result.rawData];
            model = [STMPResponseModel yy_modelWithJSON:result];
        }
        
        if (complete) {
            complete(response,model);
        }
    };
    
    
    STNRequest *nRequest = [[STNRequest alloc] initWithRequest:request completeBlock:resultBlock];
    [nRequest start];
    return nRequest;
}

+ (instancetype)post:(NSString *)url
      pramas:(id)params
completeBlock:(STMPResponseBlock)complete {
    return [self urlString:url pramas:params method:STNRequestMethodPost completeBlock:complete];
}

+ (instancetype)get:(NSString *)url
     pramas:(id)params
completeBlock:(STMPResponseBlock)complete {
    return [self urlString:url pramas:params method:STNRequestMethodGet completeBlock:complete];
}



+ (NSString *)dictionaryToQueryString:(NSDictionary *)query {
    NSMutableArray *queryArray = [NSMutableArray array];
    [query enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([key isKindOfClass:NSString.class] &&
            ([obj isKindOfClass:NSString.class] ||
             [obj isKindOfClass:NSNumber.class])
            ) {
            [queryArray addObject:[NSString stringWithFormat:@"%@=%@",key,obj]];
        }
    }];
    
    return [queryArray componentsJoinedByString:@"&"];
}

@end
