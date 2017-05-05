//
//  BaseNetwork.swift
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/5/4.
//  Copyright © 2017年 Maple. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import CryptoSwift


class BaseNetwork{
    internal func get<T:BaseMappable>(_ url:String, params:[String:Any]?, then:@escaping (_ result:T?,_ error:Error?)->Void){
        let requset = Alamofire.request(url, method: .get, parameters: params, encoding:URLEncoding.default, headers: nil)
        
        requset.responseObject { (response:DataResponse<T>) in
            if let error = response.error{
                then(nil,error)
            }else{
                then(response.result.value,nil)
            }
        }
    }
}
