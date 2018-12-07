//
//  ExpressionEditKeyWordsCellNode.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/20.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditKeyWordsCellNode: ASCellNode, ExpressionEditCellProtocol {
    
    private let titleTextNode = ASTextNode()
    
    private var model: ExpressionEditKeyWordsCellViewModel?
    
    required convenience init(modelProtocol: ExpressionEditCellModelProtocol) {
        if let model = modelProtocol as? ExpressionEditKeyWordsCellViewModel {
            self.init(model: model)
        } else {
            self.init()
        }
    }
    
    
    convenience init(model: ExpressionEditKeyWordsCellViewModel) {
        self.init()
        
        self.model = model
        
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        
        self.addSubnode(self.titleTextNode)
        
        self.titleTextNode.attributedText = NSAttributedString(string: model.titleText, attributes: [
            .font : UIFont.systemFont(ofSize: 17)
            ])        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let firstStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .spaceBetween, alignItems: .center, children: [self.titleTextNode])
        
        let secStackLayoutSpec = ASStackLayoutSpec(direction: .vertical, spacing: 15, justifyContent: .start, alignItems: .stretch, children: [firstStackLayoutSpec])
        
        let insetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15), child: secStackLayoutSpec)
        
        return insetLayoutSpec
    }
    
    
    
}

// action
extension ExpressionEditKeyWordsCellNode {
}
