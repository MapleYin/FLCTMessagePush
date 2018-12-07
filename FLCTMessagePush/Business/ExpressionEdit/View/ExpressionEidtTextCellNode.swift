//
//  ExpressionEidtTextCellNode.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/10/11.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEidtTextCellNode: ASCellNode {
    
    private let titleTextNode: ASTextNode = ASTextNode()
    
    init(text: String) {
        super.init()
        
        self.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        self.selectionStyle = .none
        
        self.titleTextNode.attributedText = NSAttributedString(string: text, attributes: [
            .font : UIFont.systemFont(ofSize: 17)
            ])
        
        self.addSubnode(self.titleTextNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        self.titleTextNode.style.flexGrow = 1
        self.titleTextNode.style.flexShrink = 1
        let insetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15), child: self.titleTextNode)
        
        return insetLayoutSpec
    }
}
