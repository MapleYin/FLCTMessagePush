//
//  ExpressionEditMiddelModeNode.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/18.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditMiddelModeNode: ASDisplayNode {
    
    let title = "中级"
    
    override init() {
        super.init()
        
        self.backgroundColor = UIColor.white
    }
}


extension ExpressionEditMiddelModeNode : ExpressionEditProtocol {
    
    func resultExpression() -> String? {
        return nil
    }
    
}
