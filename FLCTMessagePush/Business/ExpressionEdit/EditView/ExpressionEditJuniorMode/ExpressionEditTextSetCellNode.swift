//
//  ExpressionEditTextSetCellNode.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/20.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditTextSetCellNode: ASCellNode, ExpressionEditCellProtocol {

    private let titleTextNode: ASTextNode = ASTextNode()
    private var model: ExpressionEditTextSetCellViewModel?
    
    private let inputTextNode: ASDisplayNode = ASDisplayNode { () -> UIView in
        let textField = UITextField()
        textField.textAlignment = .right
        textField.returnKeyType = .done
        return textField
    }
    
    required convenience init(modelProtocol: ExpressionEditCellModelProtocol) {
        if let model = modelProtocol as? ExpressionEditTextSetCellViewModel {
            self.init(model: model)
        } else {
            self.init()
        }
    }
    
    required convenience init(model: ExpressionEditTextSetCellViewModel) {
        self.init()
        
        self.model = model
        
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        
        self.addSubnode(self.titleTextNode)
        self.addSubnode(self.inputTextNode)
        
        self.titleTextNode.attributedText = NSAttributedString(string: model.titleText, attributes: [
            .font : UIFont.systemFont(ofSize: 17)
            ])
        
        let textField = self.inputTextNode.view as! UITextField
        textField.text = model.valueText
        textField.placeholder = model.placeHolderString
        textField.delegate = self
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        self.titleTextNode.style.flexGrow = 0
        self.titleTextNode.style.flexShrink = 0
        self.inputTextNode.style.flexGrow = 1
        self.inputTextNode.style.height = ASDimensionMake(24)
        let stackLayoutSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 50, justifyContent: .center, alignItems: .center, children: [self.titleTextNode, self.inputTextNode])
        stackLayoutSpec.style.flexGrow = 1
        let insetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15), child: stackLayoutSpec)
        
        return insetLayoutSpec
    }
    
    override func didLoad() {
        super.didLoad()
        self.inputTextNode.becomeFirstResponder()
    }
}


extension ExpressionEditTextSetCellNode: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.model?.valueText = textField.text
    }
}
