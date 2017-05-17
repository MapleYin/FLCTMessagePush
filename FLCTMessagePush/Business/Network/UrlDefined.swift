//
//  UrlDefined.swift
//  UrlDefined
//
//  Created by Mapleiny on 2017/3/29.
//  Copyright © 2017年 Maple. All rights reserved.
//

import Foundation

// Mark: - Message

private let isTest = true;

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
        if isTest {
            return "http://localhost:3003/api"
        }
        return "http://demo.maple.im"
    }
    case authorize = "/authorize"
    case register = "/register"
    case message = "/message"
    case pushtoken = "/message/token.php"
}
