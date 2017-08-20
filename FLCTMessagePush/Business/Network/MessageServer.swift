//
//  MessageServer.swift
//  MessageServer
//
//  Created by Mapleiny on 2017/3/29.
//  Copyright © 2017年 Maple. All rights reserved.
//

import Foundation

class MessageServer:BaseNetwork{
    static let shared = MessageServer();
    
    func listData(then: @escaping resultCallback<[MessageModel]>) {
        self.request(MainUrl.message.url, method: .get, parameters: nil, headers: nil) { (result:ListResponseModel<MessageModel>?, error) in
            if let error = error {
                then(nil,error)
            } else if let data = result?.data {
                then(data,nil)
            } else {
                then(nil,NSError(domain: "custom.response.value", code: result?.code ?? 0, userInfo: ["message":result!.message]))
            }
        }
    }
}



