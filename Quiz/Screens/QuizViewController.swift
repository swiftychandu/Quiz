//
//  ViewController.swift
//  Quiz
//
//  Created by chandrasekhar yadavally on 5/2/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit
import Firebase

class QuizViewController: UIViewController {
    
    let button1 = OptionButton(backgroundColor: .systemYellow, with: 0)
    let button2 = OptionButton(backgroundColor: .systemRed, with: 1)
    let button3 = OptionButton(backgroundColor: .systemBlue, with: 2)
    let button4 = OptionButton(backgroundColor: .systemGreen, with: 3)
    let questionLabel = OptionLabel(frame: .zero)
    var questions: [Question] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpOptionButtons()
        view.backgroundColor = .systemBackground
        print(questions)
    }
    
    @objc func loadQuestions(num: Int) {
        let allButtons = [button1, button2,button3,button4]
        print(questions)
        let options = questions[num].options
        let question = questions[num].question
        questionLabel.text = question
        zip(allButtons, options).forEach { $0.0.setTitle($0.1, for: .normal)}
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    @objc func buttonTapped(sender: UIButton) {
        questions = DataController.questions
        print(questions.first)
        print(sender.tag)
    }
    

    func setUpOptionButtons() {
        let allButtons = [button1, button2,button3,button4]
        allButtons.forEach { $0.setUpButtonAutoLayout(in: self.view)
            $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        
        NSLayoutConstraint.activate([
            button4.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button3.bottomAnchor.constraint(equalTo: button4.topAnchor, constant: -20),
            button2.bottomAnchor.constraint(equalTo: button3.topAnchor, constant: -20),
            button1.bottomAnchor.constraint(equalTo: button2.topAnchor, constant: -20)
         ])
    }
}

