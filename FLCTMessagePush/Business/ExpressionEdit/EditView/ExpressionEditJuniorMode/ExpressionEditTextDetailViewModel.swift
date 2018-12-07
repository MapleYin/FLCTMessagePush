//
//  ExpressionEditTextDetailViewModel.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/10/11.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditTextDetailViewModel: ExpressionEditCellModelProtocol {
    let cellNodeClass: (ASCellNode & ExpressionEditCellProtocol).Type = ExpressionEditTextDetailNode.self
    
    let titleText: String
    let detailText: String
    
    init(titleText: String, detailText: String = "") {
        self.titleText = titleText
        self.detailText = detailText
    }
}
