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
    
    override init() {
        
    }
    
    required init?(map: Map){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        username = aDecoder.value(forKey: "username") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.setValue(username, forKey: "username")
    }
    
    func mapping(map: Map) {
        username <- map["username"]
    }
}
