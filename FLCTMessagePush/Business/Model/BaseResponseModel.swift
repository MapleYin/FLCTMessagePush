//
//  BaseResponseModel.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/3/29.
//  Copyright © 2017年 Maple. All rights reserved.
//

import ObjectMapper

class BaseResponseModel: Mappable {
    var code:Int!
    var message:String!
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
    }
}
