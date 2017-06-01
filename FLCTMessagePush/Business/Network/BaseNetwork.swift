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


struct encoding:ParameterEncoding {
 
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest{
        var urlRequest = try urlRequest.asURLRequest()
        
        guard let parameters = parameters else { return urlRequest }
        
        let encodeString = parameters.ecrypt()
        urlRequest.setValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = encodeString.data(using: .utf8)
        
        return urlRequest
    }
}



class BaseNetwork{
    typealias resultCallback<T:Mappable> = (_ result:T?,_ error:Error?)->()
    internal var globelHeader:HTTPHeaders = [:];
    
    init() {
//        UserManager.shared.currentUser
    }
    
    internal func request<T:BaseMappable>(_ url:String, method:HTTPMethod = .get,parameters:[String:Any]? = nil, headers:HTTPHeaders? = nil, then:@escaping resultCallback<T>){
        
        let requset = Alamofire.request(url, method: method, parameters: parameters, encoding:encoding(), headers: globelHeader.marge(headers))
        
        // TODO decode
        
        requset.responseString { (response) in
            if let error = response.error{
                then(nil,error)
            } else if let error = response.result.error{
                then(nil,error)
            } else if let value = response.result.value {
                let resultString = value.decrypt()

                if let result = resultString as? T{
                    then(result,nil)
                } else if let maybeJSONString = resultString?.data(using: String.Encoding.utf8) {
                    if let resultJSON = try? JSONSerialization.jsonObject(with: maybeJSONString, options: .allowFragments) as? [String : Any] {
                        let result:T? = Mapper().map(JSON: resultJSON!)
                        then(result,nil)
                    } else {
                        then(nil,NSError(domain: "custom.response.value", code: 0, userInfo: nil))
                    }
                } else {
                    then(nil,NSError(domain: "custom.response.value", code: 0, userInfo: nil))
                }
            }
        }
    }
}
                                                                                                                                                                                                                        
