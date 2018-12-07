//
//  ExpressionEditModel.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/10/11.
//  Copyright © 2018年 Maple. All rights reserved.
//

import Foundation

class ExpressionEditModel: NSObject, NSCoding {
    
    enum SourceType: String {
        case message = "message"
        case sender = "sender"
    }
    
    enum ConditionType: String {
        case contain = "contain"
        case except = "except"
    }
    
    var name: String = ""
    var source: SourceType = .message
    var condition: ConditionType = .contain
    var keywords: [String] = []
    
    override init() {
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.source.rawValue, forKey: "source")
        aCoder.encode(self.condition.rawValue, forKey: "condition")
        aCoder.encode(self.keywords, forKey: "keywords")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.source = SourceType(rawValue: aDecoder.decodeObject(forKey: "source") as? String ?? "") ?? .message
        self.condition = ConditionType(rawValue: aDecoder.decodeObject(forKey: "condition") as? String ?? "") ?? .contain
        self.keywords = aDecoder.decodeObject(forKey: "keywords") as? [String] ?? []
    }
    
    
}
