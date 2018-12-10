//
//  ExpressionEditSegmentSelectCellNode.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/20.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditSegmentSelectCellNode: ASCellNode, ExpressionEditCellProtocol {
    
    private let titleTextNode = ASTextNode()
    private let segmentNode = ASDisplayNode { () -> UIView in
        let segment = UISegmentedControl()
        segment.apportionsSegmentWidthsByContent = true
        return segment
    }
    private var model: ExpressionEditSegmentSelectCellViewModle?
    
    required convenience init(modelProtocol: ExpressionEditCellModelProtocol) {
        if let model = modelProtocol as? ExpressionEditSegmentSelectCellViewModle {
            self.init(model: model)
        } else {
            self.init()
        }
    }
    
    convenience init(model: ExpressionEditSegmentSelectCellViewModle) {
        self.init()
        
        self.model = model
        
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        
        self.addSubnode(self.titleTextNode)
        self.addSubnode(self.segmentNode)
        
        self.titleTextNode.attributedText = NSAttributedString(string: model.titleText, attributes: [
            .font : UIFont.systemFont(ofSize: 17)
            ])
        
        let segment = self.segmentNode.view as! UISegmentedControl
        
        model.segmentTexts.forEach { (title) in
            segment.insertSegment(withTitle: title, at: segment.numberOfSegments, animated: false)
        }
        segment.selectedSegmentIndex = model.currentSelected
        segment.addTarget(self, action: #selector(segmentValueChanged(target:)), for: .valueChanged)
        
        self.segmentNode.style.minSize = segment.intrinsicContentSize
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        self.segmentNode.style.height = ASDimensionMake(24)
        let stackLayoutSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 50, justifyContent: .spaceBetween, alignItems: .center, children: [self.titleTextNode, self.segmentNode])
        stackLayoutSpec.style.flexGrow = 1
        let insetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15), child: stackLayoutSpec)
        
        return insetLayoutSpec
    }
    
}

extension ExpressionEditSegmentSelectCellNode {
    @objc func segmentValueChanged(target: UISegmentedControl) {
        self.model?.currentSelected = target.selectedSegmentIndex
    }
}
