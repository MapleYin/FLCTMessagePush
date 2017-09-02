//
//  LoginViewController.swift
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/9/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    private let stackView = UIStackView()
    private let logoView = UIImageView()
    
    private let usernameIconView = UIImageView()
    private let passwordIconView = UIImageView()
    private let usernameInputview = UIInputView()
    private let passwordInputView = UIInputView()
    
    private let loginButton = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
    // MARK: - Praive
    
    func setupView() {
        view.addSubview(stackView)
        
        // stack view
        stackView.alignment = .center
        
        // logo
        stackView.addSubview(logoView)
        
        // username
        stackView.addSubview(usernameInputview)
        usernameInputview.addSubview(usernameIconView)
        
        // password
        stackView.addSubview(passwordInputView)
        passwordInputView.addSubview(passwordIconView)
        
        // login button
        stackView.addSubview(loginButton)
        
        
        stackView.snp.makeConstraints { (maker) in
            maker.center.equalTo(view)
        }
        
        logoView.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(stackView)
        }
        
        usernameInputview.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(stackView)
        }
        usernameIconView.snp.makeConstraints { (maker) in
            maker.leading.equalTo(usernameInputview)
            maker.centerX.equalTo(usernameInputview)
        }
        
        
        passwordInputView.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(stackView)
        }
        passwordIconView.snp.makeConstraints { (maker) in
            maker.leading.equalTo(passwordInputView)
            maker.centerX.equalTo(passwordInputView)
        }
        
        
        
    }
    
}
