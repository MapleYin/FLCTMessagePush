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
    
    typealias resultCallback<T> = (_ result:T?,_ error:Error?)->Void
    
    internal func post<T>(_ url:String,parameters:[String:Any]?, then:@escaping resultCallback<T>)where T:BaseResponseModel{
        self.request(url, method: .post, parameters: parameters, then: then)
    }
    
    internal func get<T>(_ url:String,parameters:[String:Any]?, then:@escaping resultCallback<T>)where T:BaseResponseModel{
        self.request(url, method: .get, parameters: parameters, then: then)
    }
    
    internal func request<T>(_ url:String,method:HTTPMethod,parameters:[String:Any]?, then:@escaping resultCallback<T>)where T:BaseResponseModel{
        let requset = Alamofire.request(url, method: method, parameters: parameters, encoding:URLEncoding.default, headers: nil)
        requset.responseObject { (response:DataResponse<T>) in
            if let error = response.error{
                then(nil,error)
            }else if let error = response.result.error{
                then(nil,error)
            }else{
                then(response.result.value,nil)
            }
        }
    }
}
                                                                                                                                                                                                                        
