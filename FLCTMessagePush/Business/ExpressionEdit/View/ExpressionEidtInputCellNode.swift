//
//  ExpressionEidtInputCellNode.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/10/11.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEidtInputCellNode: ASCellNode {
    
    var completeInput: ((String)->Void)?
    
    private let addIcon = ASImageNode()
    
    private let inputTextNode: ASDisplayNode = ASDisplayNode { () -> UIView in
        let textField = UITextField()
        textField.returnKeyType = .done
        textField.placeholder = "添加关键词"
        return textField
    }
    
    override init() {
        super.init()
        
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        
        self.addSubnode(self.addIcon)
        self.addSubnode(self.inputTextNode)
        
        self.addIcon.image = UIImage(named: "Add")
        
        let textField = self.inputTextNode.view as! UITextField
        textField.delegate = self
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        self.addIcon.style.preferredSize = CGSize(width: 18, height: 18)
        self.addIcon.style.flexShrink = 0
        self.addIcon.style.flexGrow = 0
        self.inputTextNode.style.flexGrow = 1
        self.inputTextNode.style.height = ASDimensionMake(24)
        let stackLayoutSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 15, justifyContent: .center, alignItems: .center, children: [self.addIcon, self.inputTextNode])
        stackLayoutSpec.style.flexGrow = 1
        let insetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15), child: stackLayoutSpec)        
        return insetLayoutSpec
    }
}


// MARK: - UITextFieldDelegate

extension ExpressionEidtInputCellNode: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let inputText = textField.text {
            textField.text = ""
            self.completeInput?(inputText)
            return true
        } else {
            return false
        }
    }
}
