//
//  LoginController.swift
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/5/4.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit

class LoginController: BaseViewController,UITextFieldDelegate {
    
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
        usernameTextField.delegate = self
//        usernameTextField.textContentType = 
        usernameTextField.placeholder = "账号"
        conteinerView.addSubview(usernameTextField)
        
        
        // password
        passwordTextField.isSecureTextEntry = true;
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.delegate = self
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
        
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        UserServer.shared.login(username: username!, password: password!) { (isLogin, error) in
            
        }
    }
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
}
