//
//  LoginController.swift
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/9/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit
import PKHUD

class LoginController : BaseViewController {
    
    private let stackView = UIStackView()
    private let logoView = UIImageView()
    
    private let usernameIconView = UIImageView()
    private let passwordIconView = UIImageView()
    private let usernameInputview = UITextField()
    private let passwordInputView = UITextField()
    
    private let loginButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    
    
    // MARK: - Praive
    
    func setupView() {
        view.backgroundColor = UIColor(hexString: "fafafa");
        view.addSubview(stackView)
        
        // stack view
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        stackView.spacing = 20
        stackView.alignment = .center

        
        // logo
        stackView.addArrangedSubview(logoView)
        logoView.image = #imageLiteral(resourceName: "icon_logo_round")
        
        // username
        stackView.addArrangedSubview(usernameInputview)
        usernameInputview.addSubview(usernameIconView)
        usernameInputview.placeholder = "UserName"
        usernameInputview.keyboardType = .asciiCapable
        
        // password
        stackView.addArrangedSubview(passwordInputView)
        passwordInputView.addSubview(passwordIconView)
        passwordInputView.placeholder = "PassWord"
        passwordInputView.keyboardType = .asciiCapable
        passwordInputView.isSecureTextEntry = true
        
        
        
        // login button
        stackView.addArrangedSubview(loginButton)
        loginButton.setTitle(NSLocalizedString("login", comment: "login button"), for: .normal)
        loginButton.setTitleColor(UIColor.black, for: .normal)
        loginButton.layer.borderWidth = 0.5
        loginButton.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        
        
        
        stackView.snp.makeConstraints { (maker) in
            maker.center.equalTo(view)
        }
        
    }
    
    
    @objc private func login(_ btn:UIButton) {
        let username = usernameInputview.text
        let password = passwordInputView.text
        HUD.show(.progress)
        UserServer.shared.login(username: username!, password: password!) { (isLogin, error) in
            if error != nil {
                HUD.flash(.error)
            } else if isLogin! {
                HUD.flash(.success)
                self.close()
            } else {
                HUD.flash(.labeledError(title:"用户名或密码错误",subtitle:nil))
            }
        }
    }
    
    private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
