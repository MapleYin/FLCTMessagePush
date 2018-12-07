//
//  FilterExpressionModel.swift
//  MessageCommon
//
//  Created by Mapleiny on 2018/9/16.
//  Copyright © 2018年 Maple. All rights reserved.
//

import Foundation

public enum FilterCheckType: String {
    case message = "message"
    case sender = "sender"
}

open class FilterExpressionModel: NSObject, NSCoding {
    
    static let defaultExpression = try! NSRegularExpression(pattern: "*")
    
    public let expressionRegular: NSRegularExpression
    
    public let checkType : FilterCheckType
    
    public init?(expression: String, checkType: FilterCheckType) {
        self.checkType = checkType
        if let exp = try? NSRegularExpression(pattern: expression) {
            self.expressionRegular = exp
        } else {
            return nil
        }
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.expressionRegular, forKey: "expressionRegular")
        aCoder.encode(self.checkType.rawValue, forKey: "checkType")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.expressionRegular = aDecoder.decodeObject(forKey: "expressionRegular") as? NSRegularExpression ?? FilterExpressionModel.defaultExpression
        self.checkType = FilterCheckType(rawValue: aDecoder.decodeObject(forKey: "checkType") as? String ?? "") ?? .message
    }
    
    public func test(_ str: String) -> Bool {
        return self.expressionRegular.numberOfMatches(in: str, options: [], range: NSRange(location: 0, length: str.count)) != 0
    }
}
