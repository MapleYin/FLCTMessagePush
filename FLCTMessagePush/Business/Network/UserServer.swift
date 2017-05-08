//
//  UserServer.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/5/8.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit

class UserServer: BaseNetwork {
    static let shared = UserServer();
    
    func register(username:String,password:String,then:@escaping(NormalResponseModel<MessageModel>?)->Void) {
    }
    
    func login(username:String,password:String,then:@escaping(NormalResponseModel<MessageModel>?)->Void) {
    }
    
    
}
