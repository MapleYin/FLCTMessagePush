//
//  ExpressionEditProtocol.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/18.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

protocol ExpressionEditProtocol {
    
    var title: String {get}
    
    func resultExpression() -> String?
}

protocol ExpressionEditCellProtocol {
    init(modelProtocol: ExpressionEditCellModelProtocol)
}

protocol ExpressionEditCellModelProtocol {
    var cellNodeClass: (ExpressionEditCellProtocol&ASCellNode).Type {get}
}
