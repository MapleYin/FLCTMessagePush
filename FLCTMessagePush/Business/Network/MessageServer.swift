//
//  MessageServer.swift
//  MessageServer
//
//  Created by Mapleiny on 2017/3/29.
//  Copyright © 2017年 Maple. All rights reserved.
//


class MessageServer:BaseNetwork{
    func listData(then: @escaping(ListResponseModel<MessageModel>?)->Void) {
        self.get(MainUrl.list.url, parameters: nil) { (result:ListResponseModel<MessageModel>, error) in
            
        }
    }
    
    func sendPushToken(_ token:String, then: @escaping(BaseResponseModel?)->Void) {
    }
}



