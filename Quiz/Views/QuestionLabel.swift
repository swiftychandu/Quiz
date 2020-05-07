//
//  QuestionLabel.swift
//  Quiz
//
//  Created by chandrasekhar yadavally on 5/5/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class QuestionLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.preferredFont(forTextStyle: .title3)
        textColor = .systemOrange
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.85
        lineBreakMode = .byWordWrapping
        textAlignment = .left
        numberOfLines = 0
    }
    
    func setUpLabelAutoLayout(in view: UIView) {
        view.addSubview(self)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: view.bounds.height/10 * 0.70),
            widthAnchor.constraint(equalToConstant: view.bounds.width * 0.90)
        ])
    }
}

