//
//  NetworkManager.swift
//  Quiz
//
//  Created by chandrasekhar yadavally on 5/4/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    let json = """
    [{"question": "The stride(from:to:by:) function is used:", "options": ["To create an interval including both the start and end values.", "To iterate over values of any type that conform to the Strideable protocol.", "To iterate over a few values that respect a particular condition.", "To validate an interval from a start value to an end value."], "answer": 0 }]
    """.data(using: .utf8)!
    
    func getQuestionsData(completion: @escaping (([Question]) -> Void)) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let questions = try! decoder.decode([Question].self, from: json)
        completion(questions)
    }
}
