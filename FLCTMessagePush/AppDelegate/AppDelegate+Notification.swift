//
//  AppDelegate+Notification.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/3/29.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit
import UserNotifications

let kDeviceToken = "kDeviceToken"

extension AppDelegate{
    func setUpNotification() -> Void{
        let center = UNUserNotificationCenter.current();
        
        center.requestAuthorization(options: [.badge,.alert,.sound]) { (granted, error) in
            if error != nil {
                print("request authorization succeeded!");
            }else{
                UIApplication.shared.registerForRemoteNotifications();
            }
        }
    }
    
    func onReciveDeviceToken(deviceToken:Data) {
        let token = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        let storedToken:String? = Cache.UserDefault.readData(kDeviceToken)
        if storedToken == nil||token != storedToken {
            MessageServer.shared.sendPushToken(token){(result) in
                if result?.code == 0{
                    _ = Cache.UserDefault.saveData(token, forKey: kDeviceToken)
                }else{
                }
            }
        }else{
            print("Same deviceToken Don't need post to server!")
        }
    }
}
