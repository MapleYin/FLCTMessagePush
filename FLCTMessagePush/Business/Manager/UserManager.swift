//
//  UserManager.swift
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/5/26.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    static let shared = UserManager()
    
    lazy var currentUser:UserModel? = {
        return Cache.Archive.readData("userInfo")
    }()

    override init() {
        super.init()
    }
    
    
    
    func updateUserInfo(_ userModel:UserModel) {
        Cache.Archive.saveData(userModel, forKey: "userInfo")
        currentUser = userModel
    }
}
