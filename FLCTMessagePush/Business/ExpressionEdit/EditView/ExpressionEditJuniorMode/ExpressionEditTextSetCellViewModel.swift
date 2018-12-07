//
//  ExpressionEditTextSetCellViewModel.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/20.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditTextSetCellViewModel: ExpressionEditCellModelProtocol {
    
    let cellNodeClass: (ASCellNode & ExpressionEditCellProtocol).Type = ExpressionEditTextSetCellNode.self

    let titleText: String
    var placeHolderString: String?
    
    var valueText: String? = nil
    
    init(titleText: String) {
        self.titleText = titleText
    }
}
