//
//  UserServer.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/5/8.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit
import Alamofire
class UserServer : BaseNetwork {
    static let shared = UserServer()
    
    func register(username:String,password:String,then:@escaping(NormalResponseModel<String>?)->Void) {
        let params = [
            "username":username,
            "password":password,
            ]
        
        self.request(MainUrl.register.url, method: .post, parameters: params) { (result:NormalResponseModel<String>?, error:Error?) in
            if let result = result {
                then(result)
            } else {
                then(nil)
            }
        }
    }
    
    func login(username:String,password:String,then:@escaping resultCallback<String>) {
        let params = [
            "username":username,
            "password":password,
            ]
        
        self.request(MainUrl.authorize.url, method: .post, parameters: params) { (result:NormalResponseModel<String>?, error:Error?) in
            if let result = result {
                if let token = result.data {
                    self.globelHeader["authorization"] = "Bearer " + token
                }
                then(result.data,nil)
            } else {
                then(nil,error)
            }
        }
    }
}
