//
//  MessageServer.swift
//  MessageServer
//
//  Created by Mapleiny on 2017/3/29.
//  Copyright © 2017年 Maple. All rights reserved.
//


class MessageServer:BaseNetwork{
    func listData(then: @escaping(ListResponseModel<MessageModel>?)->Void) {
    }
    
    func sendPushToken(_ token:String, then: @escaping(BaseResponseModel?)->Void) {
    }
}



