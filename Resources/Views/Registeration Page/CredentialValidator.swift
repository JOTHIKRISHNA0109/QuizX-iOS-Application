//
//  CredentialValidator.swift
//  QuizX
//
//  Created by jothi-pt5112 on 28/07/22.
//

import Foundation

struct CredentialValidator {
    
    
    static func userNameValidator(text:String?) -> Bool {
        if (text!.range(of: ".*[0-9]+.*", options: .regularExpression) == nil) && text != "" {
            return true
        }
        return false
    }
    
    static func mailIdValidator(text:String?) -> Bool {
        
        if text != nil && isValidEmail(text!) {
            return true
        }
        return false
    }
//
    static func passwordValidator(text:String?)->Bool {
        
        if text != nil && isValidPassword(text!) {
            return true
        }
        else {
            return false
        }

    }
//
    static func confirmPasswordValidator(text1:String?,text2:String?)->Bool {
        
        if text1 != text2 {
            return false
        }
        else{return true}
    }
////
    static func nickNameValidator(text:String?)->Bool {
        if text != "" {
            return true
        }
        return false
    }
//
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

   static func isValidPassword(_ password: String) -> Bool {

        let passwordRegEX = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"

        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEX)
        return passwordPred.evaluate(with: password)
    }
}
