//
//  STMPMessageListDataManager.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/22.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPMessageListDataManager.h"
#import "NSDictionary+Crypto.h"
#import "STMPResponseModel.h"
#import "STMPMessageModel.h"

@interface STMPMessageListDataManager()

@property (nonatomic, strong) NSMutableArray *viewModelList;
@property (nonatomic, strong) NSMutableArray *modelList;

@end

@implementation STMPMessageListDataManager

@synthesize modelList = _modelList;

- (STMPMessageModel *)modelAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= 0 && indexPath.row < self.modelList.count) {
        return self.modelList[indexPath.row];
    }
    return nil;
}

- (void)loadData:(void(^)(NSArray<STMPMessageModel *> *result, NSError *error))complete {
    [STNRequest get:@"http://api.sms.maple.im/message/fetch"
             pramas:nil
      completeBlock:^(STNResponse *response, STMPResponseModel *result) {
          NSError *error;
          NSMutableArray *resultArray;
          if (!response.error) {
              if (result.code == 0) {
                  resultArray = [NSMutableArray array];
                  if ([result.data isKindOfClass:NSArray.class]) {
                      NSArray *dataList = result.data;
                      [dataList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                          STMPMessageModel *model = [STMPMessageModel yy_modelWithJSON:obj];
                          if (model) {
                              [resultArray addObject:model];
                          }
                      }];
                  }
              } else {
                  error = [result customError];
              }
          } else {
              error = response.error;
          }
          
          if (complete) {
              self.modelList = resultArray;
              complete(resultArray,error);
          }
    }];
}

@end
