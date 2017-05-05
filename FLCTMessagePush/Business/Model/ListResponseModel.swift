//
//  ListResponseModel.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/3/29.
//  Copyright © 2017年 Maple. All rights reserved.
//

import ObjectMapper

class ListResponseModel<T:Mappable>: BaseResponseModel {
    var data : [T]?
    required init?(map: Map){
        super.init(map:map);
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        data <- map["data"];
    }
}
