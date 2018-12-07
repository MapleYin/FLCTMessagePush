//
//  ExpressionEditSeniorModeNode.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/18.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditSeniorModeNode: ASDisplayNode {
    
    let title = "高级"
    
    override init() {
        super.init()
        
        self.backgroundColor = UIColor.white
    }
}


extension ExpressionEditSeniorModeNode : ExpressionEditProtocol {
    
    func resultExpression() -> String? {
        return nil
    }
    
}

