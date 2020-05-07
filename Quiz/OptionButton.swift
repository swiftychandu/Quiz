//
//  OptionButton.swift
//  Quiz
//
//  Created by chandrasekhar yadavally on 5/2/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class OptionButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(backgroundColor: UIColor, with tag: Int) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.tag = tag
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 30
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.numberOfLines = 2
        titleLabel?.textAlignment = .left
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    
    func setUpButtonAutoLayout(in view: UIView) {
        view.addSubview(self)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            heightAnchor.constraint(equalToConstant: view.bounds.height/10 * 0.90)
        ])
    }

}
