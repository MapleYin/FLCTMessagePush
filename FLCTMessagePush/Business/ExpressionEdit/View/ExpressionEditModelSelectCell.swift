//
//  ExpressionEditModelSelectCell.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/18.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit
import MessageCommon

class ExpressionEditModelSelectCell: ASCellNode {
    
    let containerNode = ASDisplayNode()
    let textNode = ASTextNode2()
    
    
    init(modle: ExpressionEditTypeModel) {
        super.init()
        
        self.selectionStyle = .none
        
        self.textNode.attributedText = NSAttributedString(string: modle.name, attributes: [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.white
        ])
        self.containerNode.backgroundColor = modle.backgroundColor
        self.containerNode.cornerRadius = 10

        self.addSubnode(self.containerNode)
        self.addSubnode(self.textNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let textLayoutSpec = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: self.textNode)
        
        let backgroundLayoutSpec = ASBackgroundLayoutSpec(child: textLayoutSpec, background: self.containerNode)
        backgroundLayoutSpec.style.flexGrow = 1
        
        let centerLayout = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .center, alignItems: .stretch, flexWrap: .noWrap, alignContent: .stretch, children: [backgroundLayoutSpec])
        centerLayout.style.minHeight = ASDimensionMakeWithPoints(120)
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15), child: centerLayout)
    }
}
