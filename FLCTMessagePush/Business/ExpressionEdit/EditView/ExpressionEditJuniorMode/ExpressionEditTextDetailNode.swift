//
//  ExpressionEditTextDetailNode.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/10/11.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditTextDetailNode: ASCellNode, ExpressionEditCellProtocol {
    
    private let titleTextNode = ASTextNode()
    private let detailTextNode = ASTextNode()
    
    required convenience init(modelProtocol: ExpressionEditCellModelProtocol) {
        if let model = modelProtocol as? ExpressionEditTextDetailViewModel {
            self.init(model: model)
        } else {
            self.init()
        }
    }
    
    convenience init(model: ExpressionEditTextDetailViewModel) {
        self.init()
        
        
        self.backgroundColor = UIColor.white
        self.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        
        self.accessoryType = .disclosureIndicator
        
        self.addSubnode(self.titleTextNode)
        self.addSubnode(self.detailTextNode)
        
        self.titleTextNode.attributedText = NSAttributedString(string: model.titleText, attributes: [
            .font : UIFont.systemFont(ofSize: 17)
            ])
        
        self.detailTextNode.attributedText = NSAttributedString(string: model.detailText, attributes: [
            .font : UIFont.systemFont(ofSize: 14),
            .foregroundColor : UIColor.metaText
            ])
    }
    
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        var elements: [ASLayoutElement] = [self.titleTextNode]
        if let attr = self.detailTextNode.attributedText, attr.length > 0 {
            elements.append(self.detailTextNode)
        }
        
        let firstStackLayoutSpec = ASStackLayoutSpec(direction: .vertical, spacing: 10, justifyContent: .spaceBetween, alignItems: .start, children: elements)
        self.detailTextNode.style.flexShrink = 0
        
        let secStackLayoutSpec = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .stretch, children: [firstStackLayoutSpec])
        
        let insetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15), child: secStackLayoutSpec)
        
        return insetLayoutSpec
    }
    
}
