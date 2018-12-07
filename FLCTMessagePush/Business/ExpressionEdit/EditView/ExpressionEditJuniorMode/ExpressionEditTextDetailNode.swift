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
            .font : UIFont.systemFont(ofSize: 17),
            .foregroundColor : UIColor.metaText
            ])
    }
    
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let firstStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .spaceBetween, alignItems: .center, children: [self.titleTextNode, self.detailTextNode])
        
        let secStackLayoutSpec = ASStackLayoutSpec(direction: .vertical, spacing: 15, justifyContent: .start, alignItems: .stretch, children: [firstStackLayoutSpec])
        
        let insetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15), child: secStackLayoutSpec)
        
        return insetLayoutSpec
    }
    
}
