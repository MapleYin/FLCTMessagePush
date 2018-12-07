//
//  ExpressionEditKeyWordsCellViewModel.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/20.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditKeyWordsCellViewModel: ExpressionEditCellModelProtocol {
    let cellNodeClass: (ASCellNode & ExpressionEditCellProtocol).Type = ExpressionEditKeyWordsCellNode.self
    
    let titleText: String
    
    init(titleText: String) {
        self.titleText = titleText
    }
}
