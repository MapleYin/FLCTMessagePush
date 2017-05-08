//
//  UserModel.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/5/8.
//  Copyright © 2017年 Maple. All rights reserved.
//

import ObjectMapper

class UserModel: Mappable {
    var username:String!
    var token:String!
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        username <- map["username"]
    }
}
