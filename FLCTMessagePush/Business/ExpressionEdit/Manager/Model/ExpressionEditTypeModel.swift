//
//  ExpressionEditTypeModel.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/18.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditTypeModel: NSObject, NSCoding {
    
    let name: String
    let backgroundColor: UIColor
    let editClass: (ASDisplayNode&ExpressionEditProtocol).Type
    
    init(name: String, backgroundColor: UIColor, editClass: (ASDisplayNode&ExpressionEditProtocol).Type) {
        self.name = name
        self.backgroundColor = backgroundColor
        self.editClass = editClass

        super.init()
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.backgroundColor, forKey: "backgroundColor")
        aCoder.encode(NSStringFromClass(self.editClass), forKey: "editClass")
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.backgroundColor = aDecoder.decodeObject(forKey: "backgroundColor") as? UIColor ?? UIColor.white
        let classString = aDecoder.decodeObject(forKey: "editClass") as? String ?? ""
        let editClass = NSClassFromString(classString) as? (ASDisplayNode&ExpressionEditProtocol).Type ?? ExpressionEditJuniorModeNode.self
        self.editClass = editClass
    }
}
