//
//  LoginController.swift
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/5/4.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit

class LoginController: BaseViewController {
    
    let conteinerView = UIView()
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    
    let submitButton = UIButton(type: UIButtonType.custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
    }
    
    
    
    private func buildUI() {
        
        self.view.backgroundColor = UIColor.white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close))
        
        self.view.addSubview(conteinerView)
        
        // username
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.placeholder = "账号"
        conteinerView.addSubview(usernameTextField)
        
        
        // password
        passwordTextField.isSecureTextEntry = true;
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "密码"
        conteinerView.addSubview(passwordTextField)
        
        // button
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        submitButton.setTitle(NSLocalizedString("login", comment: "login button"), for: .normal)
        submitButton.setTitleColor(UIColor.black, for: .normal)
        submitButton.layer.borderWidth = 0.5
        submitButton.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        
        conteinerView.addSubview(submitButton)
        
        
        
        conteinerView.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(self.view)
            maker.centerY.equalTo(self.view).offset(-20)
            maker.width.equalTo(150)
        }
        
        usernameTextField.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(conteinerView)
            maker.top.equalTo(conteinerView)
            maker.height.equalTo(20)
            maker.width.equalTo(conteinerView)
        }
        
        passwordTextField.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(conteinerView)
            maker.top.equalTo(usernameTextField.snp.bottom).offset(10)
            maker.height.equalTo(usernameTextField)
            maker.width.equalTo(conteinerView)
        }
        
        submitButton.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(conteinerView)
            maker.top.equalTo(passwordTextField.snp.bottom).offset(20)
            maker.bottom.equalTo(conteinerView)
            maker.width.equalTo(conteinerView)
        }
    }

    
    @objc private func login(_ btn:UIButton) {
        UserServer.shared.login(username: "maple1058", password: "maple1105") { (token, error) in

        }
    }
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
