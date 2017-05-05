//
//  UrlDefined.swift
//  UrlDefined
//
//  Created by Mapleiny on 2017/3/29.
//  Copyright © 2017年 Maple. All rights reserved.
//

import Foundation

// Mark: - Message

protocol AppUrl{
    var host:String{get}
    var rawValue:String{get}
}

extension AppUrl{
    var url:String{
        return self.host+self.rawValue
    }
}

enum MainUrl:String,AppUrl{
    var host:String{
        return "http://demo.maple.im"
    }
    
    case list = "/message/read.php"
    case pushtoken = "/message/token.php"
}
