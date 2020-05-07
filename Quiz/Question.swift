//
//  Question.swift
//  Quiz
//
//  Created by chandrasekhar yadavally on 5/4/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

struct Question: Codable {
    let question: String
    let options: [String]
    let answer: Int
}
