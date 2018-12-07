//
//  ChatInputAccessoryView.swift
//  TextInputDemo
//
//  Created by Maple Yin on 2017/6/30.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit

class ChatInputAccessoryView: UIInputView {
    
    private static let preferredHeight: CGFloat = 54.0
    
    let containerView = UIView()
    
    let expandingTextView = UITextView()
    
    let sendButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        let titleString = "发送"
        button.setTitle(titleString, for: UIControlState.normal)
        
        return button
    }()
    
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        
        return separatorView
    }()
    
    //    override func sizeThatFits(_ size: CGSize) -> CGSize {
    //        return CGSize(width: size.width, height: ChatInputAccessoryView.preferredHeight)
    //    }
    
    override var intrinsicContentSize: CGSize {
        var newSize = bounds.size
        if expandingTextView.bounds.size.height > 0.0 {
            newSize.height = expandingTextView.bounds.size.height + 20.0
        }
        if newSize.height < ChatInputAccessoryView.preferredHeight || newSize.height > 120.0 {
            newSize.height = ChatInputAccessoryView.preferredHeight
        }
        return newSize
    }
    
    override init(frame: CGRect, inputViewStyle: UIInputViewStyle) {
        super.init(frame: frame, inputViewStyle: inputViewStyle)
        
        addSubview(containerView)
        addSubview(separatorView)
        containerView.addSubview(expandingTextView)
        containerView.addSubview(sendButton)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        separatorView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        let guide = layoutMarginsGuide
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        expandingTextView.translatesAutoresizingMaskIntoConstraints = false
        expandingTextView.textContainer.heightTracksTextView = true
        expandingTextView.isScrollEnabled = false
        expandingTextView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        expandingTextView.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -10.0).isActive = true
        expandingTextView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10.0).isActive = true
        expandingTextView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10.0).isActive = true
        expandingTextView.backgroundColor = UIColor.red
        expandingTextView.layer.borderWidth = 0.5
        expandingTextView.layer.cornerRadius = 5
        expandingTextView.setContentHuggingPriority(.defaultHigh, for: UILayoutConstraintAxis.vertical)
        expandingTextView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        sendButton.sizeToFit()
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.setContentHuggingPriority(.defaultHigh, for: UILayoutConstraintAxis.horizontal)
        sendButton.setContentCompressionResistancePriority(.defaultHigh, for: UILayoutConstraintAxis.horizontal)
        sendButton.bottomAnchor.constraint(equalTo: expandingTextView.bottomAnchor).isActive = true
        sendButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
