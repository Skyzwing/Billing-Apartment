//
//  UsersViewModel.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 30/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation

struct UsersViewModel {
    
    var userModel: UserModel?
    
    
//    MARK: - Validation checkins
    func isEmpty(field: String) -> Bool {
        return field.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
//    func passwordMatching(confirmPassword: String) -> Bool {
//        return confirmPassword == userModel.
//    }
    
    func isEmailValidation(email: String) -> Bool {
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailTest.evaluate(with: userModel)
    }
    
//    func isPasswordValidation(password: String) -> Bool {
////        password must be minimum eight characters, at least one letter and one number
//        let passwordTest = NSPredicate(format:"SELF MATCHES %@", "^(?=.*[a-z])[A-Za-z\\d$@$#!%*?&]{8,}")
//        return passwordTest.evaluate(with: <#T##Any?#>)
//    }
    
//    var enableSignUpButton: Bool {
//        if !isEmailValidation(email: <#T##String#>) ||
//        isEmpty(field: <#T##String#>) ||
//        !isPasswordValidation(password: <#T##String#>) ||
//        !passwordMatching(confirmPassword: <#T##String#>){
//            return false
//        } else {
//            return true
//        }
//    }
//
//    var enableLoginButton: Bool {
//        if isEmpty(field: <#T##String#>) ||
//            isEmpty(field: <#T##String#>) {
//            return false
//        } else {
//            return true
//        }
//    }
}
