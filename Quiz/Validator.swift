//
//  Validator.swift
//  Quiz
//
//  Created by chandrasekhar yadavally on 5/7/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

class Validator {
    
    static func isPasswordValid(_ password : String) -> Bool {
          
          let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,}")
          return passwordTest.evaluate(with: password)
      }
    
   static func isEmailValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
