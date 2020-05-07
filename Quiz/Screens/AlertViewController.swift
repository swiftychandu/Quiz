//
//  AlertViewController.swift
//  Quiz
//
//  Created by chandrasekhar yadavally on 5/7/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    let containerView = UIView()
    let alertTitleLabel = OptionLabel(frame: .zero)
    let alertMessageLabel = BodyLabel(frame: .zero)
    let alertButton = OptionButton(frame: .zero)
    
    var alertTitle: String?
    var alertMessage: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.alertMessage = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureAlertButton()
        configureAlertMessageLabel()
    }
    
    private func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 200),
            containerView.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    private func configureTitleLabel() {
        containerView.addSubview(alertTitleLabel)
        alertTitleLabel.textAlignment = .center
        alertTitleLabel.backgroundColor = .systemGray4
        alertTitleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            alertTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            alertTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            alertTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            alertTitleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func configureAlertButton() {
        containerView.addSubview(alertButton)
        alertButton.backgroundColor = .systemPink
        alertButton.setTitle(buttonTitle ?? "OK", for: .normal)
        alertButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            alertButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            alertButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            alertButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            alertButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureAlertMessageLabel() {
        containerView.addSubview(alertMessageLabel)
        alertMessageLabel.text = alertMessage ?? "Unable to Complete Request"
        alertMessageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            alertMessageLabel.topAnchor.constraint(equalTo: alertTitleLabel.bottomAnchor, constant: 8),
            alertMessageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            alertMessageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            alertMessageLabel.bottomAnchor.constraint(equalTo: alertButton.topAnchor, constant: -12)
        ])
        
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    

}
