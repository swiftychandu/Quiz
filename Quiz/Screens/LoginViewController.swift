//
//  LoginViewController.swift
//  Quiz
//
//  Created by chandrasekhar yadavally on 5/6/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let usernameTextField = QTextField(frame: .zero)
    let passwordTextField = QTextField(frame: .zero)
    let loginButton = OptionButton(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        addSubviews(views: usernameTextField,passwordTextField,loginButton)
        usernameTextField.placeholder = "  Enter username"
        usernameTextField.returnKeyType = .done
        passwordTextField.placeholder = "  Enter Password"
        passwordTextField.returnKeyType = .go
        passwordTextField.isSecureTextEntry = true
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        loginButton.backgroundColor = .systemGreen
        loginButton.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            usernameTextField.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.4)
        ])
        
        
    }
    


}
