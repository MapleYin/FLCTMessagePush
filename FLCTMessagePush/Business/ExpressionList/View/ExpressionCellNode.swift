//
//  ExpressionCellNode.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/16.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit
import MessageCommon

class ExpressionCellNode: ASCellNode {
    
    private let titleTextNode = ASTextNode()
    private let detailTextNode = ASTextNode()
    
    convenience init(model: ExpressionEditModel) {
        
        self.init()
        
        self.backgroundColor = UIColor.white
        self.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        
        self.accessoryType = .disclosureIndicator
        
        self.addSubnode(self.titleTextNode)
        self.addSubnode(self.detailTextNode)
        
        self.titleTextNode.attributedText = NSAttributedString(string: model.name, attributes: [
            .font : UIFont.systemFont(ofSize: 17)
            ])
        self.titleTextNode.style.flexShrink = 0
        self.titleTextNode.style.flexGrow = 1
        
        let keyWords = model.keywords[0..<min(10, model.keywords.count)].joined(separator: " ")
        self.detailTextNode.maximumNumberOfLines = 1
        self.detailTextNode.style.flexShrink = 1
        self.detailTextNode.style.flexGrow = 0
        self.detailTextNode.attributedText = NSAttributedString(string: keyWords, attributes: [
            .font : UIFont.systemFont(ofSize: 17),
            .foregroundColor : UIColor.metaText
            ])
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let firstStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 20, justifyContent: .spaceBetween, alignItems: .center, children: [self.titleTextNode, self.detailTextNode])
        
        let secStackLayoutSpec = ASStackLayoutSpec(direction: .vertical, spacing: 15, justifyContent: .start, alignItems: .stretch, children: [firstStackLayoutSpec])
        
        let insetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 11, left: 20, bottom: 11, right: 0), child: secStackLayoutSpec)
        
        return insetLayoutSpec
    }
}
