//
//  MessageModel.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/3/29.
//  Copyright © 2017年 Maple. All rights reserved.
//

import ObjectMapper

class MessageModel: Mappable {
    var content:String!
    var date:Date!
    var form:String!
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        content <- map["content"]
        date <- (map["date"],DateTransform())
        form <- map["fromAddress"]
    }
}
