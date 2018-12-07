
//
//  ExpressionEditJuniorModeNode.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/18.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditJuniorModeNode: ASTableNode {
    
    let title = "添加规则"
    
    var model: ExpressionEditModel
    
    init(model: ExpressionEditModel? = nil) {
        
        self.model = model ?? ExpressionEditModel()
        
        super.init(style: .grouped)
        
        self.backgroundColor = UIColor.screenBackground
        
        self.view.keyboardDismissMode = .interactive
        
        
        self.createInputElementData()
    }
}

extension ExpressionEditJuniorModeNode {
    func createInputElementData() {
        
        
    }
}


extension ExpressionEditJuniorModeNode : ExpressionEditProtocol {
    
    func resultExpression() -> String? {
        return nil
    }
    
}
