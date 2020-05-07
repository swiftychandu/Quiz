//
//  SignUpViewController.swift
//  Quiz
//
//  Created by chandrasekhar yadavally on 5/7/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    let nameTextField = QTextField(frame: .zero)
    let emailTextField = QTextField(frame: .zero)
    let passwordTextField = QTextField(frame: .zero)
    let signUpButton = OptionButton(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func validateFields() -> String? {
        guard nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != nil,
            let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
                return "Please fill in all the fields"
        }
        guard Validator.isEmailValid(email) else {
            return "Invalid email. Please enter a valid email."
        }
        guard Validator.isPasswordValid(password) else {
            return "Password must contain min 6 characters,a special and a number"
        }        
        return nil
    }
    
    
    @objc func signUpTapped() {
        let error = validateFields()
        guard error == nil else {
        let alertVC = AlertViewController(title: "Error", message: error!, buttonTitle: "OK")
            present(alertVC, animated: true)
            return
        }
        Auth.auth().createUser(withEmail: "test@test.com", password: "Welcome@100") { authResult, error in
            guard error == nil else {
                let alertVC = AlertViewController(title: "Error", message: "Error creating user", buttonTitle: "OK")
                self.present(alertVC, animated: true)
                return
            }
            print(authResult)
            let db = Firestore.firestore()
            db.collection("users").addDocument(data: ["username": "test@test.com", "uid": authResult!.user.uid])
        }
        
    }
    
    func configureUI() {
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        view.backgroundColor = .systemBackground
        addSubviews(views: nameTextField,emailTextField,passwordTextField,signUpButton)
        nameTextField.placeholder = "  Enter name"
        nameTextField.returnKeyType = .done
        emailTextField.placeholder = "  Enter email"
        emailTextField.returnKeyType = .done
        passwordTextField.placeholder = "  Enter Password"
        passwordTextField.returnKeyType = .go
        passwordTextField.isSecureTextEntry = true
        
        signUpButton.setTitle("Login", for: .normal)
        signUpButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        signUpButton.backgroundColor = .systemGreen
        signUpButton.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.4),
            
            nameTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -30),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}
