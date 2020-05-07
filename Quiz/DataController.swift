//
//  DataController.swift
//  Quiz
//
//  Created by chandrasekhar yadavally on 5/6/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation
import Firebase

class DataController {
    static var questions: [Question] = [] 

static func fetchData() {
    print("Fect method executed")
        let db = Firestore.firestore()
       db.collection("questions").getDocuments { snapshot, error in
           guard error == nil else { print("read error"); return }
           guard let snapshot = snapshot else {
               print("Data doesn't exist")
               return
           }
        self.questions = snapshot.documents.map { document -> Question in
       let results = Question(question: document["question"] as? String ?? "question error", options: document["options"] as? [String] ?? ["no options"], answer: document["answer"] as? Int ?? 0)
              return results
           }
       }
   }
}
