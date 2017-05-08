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

struct encoding:ParameterEncoding {
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest{
        var urlRequest = try urlRequest.asURLRequest()
        
        guard let parameters = parameters else { return urlRequest }

        if let data = try? JSONSerialization.data(withJSONObject: parameters){
            let aes = try AES(key: "", iv: "")

            let ciphertext = try aes.encrypt(data)
            urlRequest.httpBody = ciphertext.toHexString().data(using: String.Encoding.utf8)
        }
        
        return urlRequest
    }
}

class BaseNetwork{
    
    typealias resultCallback<T:Mappable> = (_ result:T?,_ error:Error?)->()
    
    internal func request<T:BaseMappable>(_ url:String, method:HTTPMethod = .get,parameters:[String:Any]? = nil, headers:HTTPHeaders? = nil, then:@escaping resultCallback<T>){
        let requset = Alamofire.request(url, method: method, parameters: parameters, encoding:URLEncoding.default, headers: headers)
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
                                                                                                                                                                                                                        
