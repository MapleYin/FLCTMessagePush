//
//  UserModel.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/5/8.
//  Copyright © 2017年 Maple. All rights reserved.
//

import ObjectMapper

class UserModel: NSObject, Mappable,NSCoding {
    var username:String!
    var token:String!
    
    required init?(map: Map){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        username = aDecoder.value(forKey: "username") as! String
        token = aDecoder.value(forKey: "token") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.setValue(username, forKey: "username")
        aCoder.setValue(token, forKey: "token")
    }
    
    func mapping(map: Map) {
        username <- map["username"]
        token <- map["token"]
    }
}
