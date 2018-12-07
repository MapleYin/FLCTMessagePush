//
//  ExpressionCellNode.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/16.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit
import MessageCommon

class ExpressionCellNode: ASTextCellNode {
    
    init(model: ExpressionEditModel) {
        super.init(attributes: [
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
            ], insets: UIEdgeInsets(top: 11, left: 15, bottom: 11, right: 15))
//        self.text = model.expressionRegular.pattern
        self.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}
